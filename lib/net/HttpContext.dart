import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'package:flutter_app_sample/common/config/ApiConfig.dart';
import 'package:flutter_app_sample/common/util/ToastUtil.dart';
import 'package:flutter_app_sample/common/util/LogUtil.dart';

///https://github.com/flutterchina/dio
///
///getHttp(...)
///postHttp(...)
///ResponseCallback...
///SuccessData...
///FailureData...
typedef SuccessCallback = Function(SuccessData success);
typedef FailureCallback = Function(FailureData failure);

class HttpContext {
  ///Config-start!
  static final String TAG_LOG = "HttpContext";

  ///业务层响应成功码
  static final int BUSINESS_OK_CODE = 200;

  ///Config-end!

  ///表示期望以那种格式(方式)请求数据
  static ContentType formUrlencodedContentType =
      ContentType.parse("application/x-www-form-urlencoded");
  static ContentType jsonContentType =
      ContentType("application", "json", charset: "utf-8");

  ///表示期望以那种格式(方式)接收响应数据
  static ResponseType jsonResponseType = ResponseType.json;
  static ResponseType streamResponseType = ResponseType.stream;
  static ResponseType plainResponseType = ResponseType.plain;

  ///Single instance.
  Dio dio = new Dio();

  HttpContext() {}

  ///创建配置参数
  static BaseOptions createOptions() {
    return BaseOptions(
      baseUrl: ApiConfig.BASE_URL,
      connectTimeout: ApiConfig.CONNECT_TIME_OUT,
      receiveTimeout: ApiConfig.RECEIVE_TIME_OUT,
      contentType: formUrlencodedContentType.toString(),
      responseType: jsonResponseType,
    );
  }

  static Dio createDio() {
    BaseOptions baseOptions = createOptions();
    return configDio(
      dio: Dio(baseOptions),
    );
  }

  static Dio configDio({
    @required Dio dio,
  }) {
    //添加网络交互拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        // 在请求被发送之前做一些事情
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (Response response) {
        // 在返回响应数据之前做一些预处理
        return response; // continue
      },
      onError: (DioError e) {
        // 当请求失败时做一些预处理
        return e; //continue
      },
    ));
    //添加日志拦截器
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return dio;
  }

  ///Get request!
  getHttp({
    @required GetOption getOption,
    @required ResponseCallback responseCallback,
  }) async {
    Dio dio = createDio();

    try {
      Response response = await dio.get(
        getOption.urlPath,
        queryParameters: getOption.queryParameters,
        //接收进度
        onReceiveProgress: (int count, int total) {
          print("ReceiveProgress --> total: $total , count: $count !");
        },
      );

      //交互成功
      //Success
      successHttp(response: response, responseCallback: responseCallback);
    } on DioError catch (e) {
      //Callback
      //Response failure.
      failureHttp(e: e, responseCallback: responseCallback);
    }
  }

  ///Post request!
  postHttp({
    @required PostOption postOption,
    @required ResponseCallback responseCallback,
  }) async {
    Dio dio = createDio();

    try {
      Response response = await dio.post<String>(
        //地址
        postOption.urlPath,
        //数据
        data: postOption.data,
        //发送进度
        onSendProgress: (int count, int total) {
          print("SendProgress --> total: $total , count: $count !");
        },
        //接收进度
        onReceiveProgress: (int count, int total) {
          print("ReceiveProgress --> total: $total , count: $count !");
        },
      );
      //Success
      successHttp(response: response, responseCallback: responseCallback);
    } on DioError catch (e) {
      //Failure
      failureHttp(e: e, responseCallback: responseCallback);
    }
  }

  ///HTTP Response success!
  ///增加对业务响应的处理
  successHttp({
    @required Response response,
    @required ResponseCallback responseCallback,
  }) {
//    BaseResponse baseResponse = json.decode(response.data);
    Map<String, dynamic> mapResponse = json.decode(
      response.data,
    );

    BaseBusinessResponse baseBusinessResponse = BaseBusinessResponse();
    baseBusinessResponse.status = mapResponse['status'];
    baseBusinessResponse.message = mapResponse['message'];

    if (baseBusinessResponse.status != BUSINESS_OK_CODE) {
      LogUtil.logWithTag(
        tag: "HttpContext",
        message: baseBusinessResponse.toString(),
      );
      LogUtil.logWithTag(
        tag: "HttpContext",
        message: baseBusinessResponse.status,
      );

      ///业务层响应失败
      failureBusiness(
          baseBusinessResponse: baseBusinessResponse,
          responseCallback: responseCallback);
      return;
    }

    //响应数据
    SuccessData successData = SuccessData();
    //交互成功
    //填充成功的数据
    successData.data = response.data;
    successData.code = response.statusCode;
    successData.message = response.statusMessage;

    //网络层
    LogUtil.logWithTag(
        tag: TAG_LOG,
        message:
            "Response Http Data -> message:${successData.message},code:${successData.code}");
    LogUtil.logWithTag(
        tag: TAG_LOG, message: "Response Business Data:${successData.data}");

    //Callback
    //Response success!
    responseCallback.successCallback(successData);
  }

  ///HTTP Response failure!
  failureHttp({
    @required DioError e,
    @required ResponseCallback responseCallback,
  }) {
    FailureData failureData = FailureData();

    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.request);
      print(e.message);
    }

    //填充失败的数据
    failureData.message = e.message;

    //Callback
    //Response failure.
    responseCallback.failureCallback(failureData);
  }

  ///业务层响应失败
  void failureBusiness({
    @required BaseBusinessResponse baseBusinessResponse,
    @required ResponseCallback responseCallback,
  }) {
    FailureData failureData = FailureData();

    //填充失败的数据
    failureData.message = baseBusinessResponse.message;
    failureData.code = baseBusinessResponse.status.toString();

    //Callback
    //Response failure.
    ToastUtil.showToast(message: failureData.message);
    responseCallback.failureCallback(failureData);
  }
}

class GetOption {
  String _urlPath;
  Map<String, dynamic> _queryParameters;

  ///Setter\Getter
  Map<String, dynamic> get queryParameters => _queryParameters;
  String get urlPath => _urlPath;

  GetOption({
    @required String urlPath,
    @required Map<String, dynamic> queryParameters,
  }) {
    this._urlPath = urlPath;
    this._queryParameters = queryParameters;
  }
}

///POST request option!
class PostOption {
  String _urlPath;
  dynamic _data;

  //Setter\Getter
  String get urlPath => _urlPath;
  dynamic get data => _data;

  PostOption({
    @required String urlPath,
    @required dynamic data,
  }) {
    this._urlPath = urlPath;
    this._data = data;
  }
}

///HTTP Dio response base template!
class BaseResponse {
  /// 响应数据，可能已经被转换了类型, 详情请参考Options中的[ResponseType].
  var data;

  /// 响应头
  HttpHeaders headers;

  /// 本次请求信息
  Options request;

  /// Http status code.
  int statusCode;

  /// 是否重定向
  bool isRedirect;

  /// 重定向信息
  List<RedirectInfo> redirects;

  /// 最终真正的请求地址(因为可能会重定向)
  Uri realUri;

  /// 响应对象的自定义字段（可以在拦截器中设置它），调用方可以在`then`中获取.
  Map<String, dynamic> extra;
}

///业务层基本响应数据
class BaseBusinessResponse {
//  dynamic data;
  String message;
  int status;
}

///HTTP Response callback!
class ResponseCallback {
  SuccessCallback successCallback;
  FailureCallback failureCallback;

  ResponseCallback({
    @required this.successCallback,
    @required this.failureCallback,
  });
}

///HTTP Response success's data!
class SuccessData {
  String message;
  int code;
  String data;

  @override
  String toString() {
    return "Success -> message:$message,code:$code,data:$data";
  }

  Map<String, dynamic> toObject() {
    ///有错误，等待修复、完善！
    Map<String, dynamic> resultObject = json.decode(data);
    return resultObject;
  }
}

///HTTP Response failure's data!
class FailureData {
  String message;
  String code;

  @override
  String toString() {
    return "Failure -> message:$message,code:$code";
  }
}
