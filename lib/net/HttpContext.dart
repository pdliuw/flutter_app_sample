import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter_app_sample/common/config/ApiConfig.dart';

///https://github.com/flutterchina/dio
///
///
typedef SuccessCallback = Function(SuccessData success);
typedef FailureCallback = Function(FailureData failure);

class HttpContext {
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
      contentType: formUrlencodedContentType,
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

  getHttp({@required GetOption getOption}) async {
    Dio dio = createDio();

//    dio.get(path);
  }

  postHttp(
      {@required PostOption postOption,
      @required ResponseCallback responseCallback}) async {
    //响应数据
    SuccessData successData = SuccessData();
    FailureData failureData = FailureData();

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
      //交互成功
      //填充成功的数据
      successData.data = response.toString();
      successData.code = response.statusCode;
      successData.message = response.statusMessage;
    } on DioError catch (e) {
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
    }

    //Callback
    responseCallback.successCallback(successData);
    responseCallback.failureCallback(failureData);
  }

  void getVerificationCode({void call(String responseStr)}) async {
    postHttp(
        postOption: PostOption(
          urlPath: "/api/app/v1/LoginCtrl/getVerificationCode",
          data: {
            "mobile": "18518176804",
            "type": "APP_LOGIN",
          },
        ),
        responseCallback: ResponseCallback(
          successCallback: (SuccessData successData) {
            call(successData.data);
          },
          failureCallback: (FailureData failureData) {
            call(failureData.message);
          },
        ));
  }
}

class GetOption {}

class PostOption {
  String urlPath;
  dynamic data;

  PostOption({
    @required this.urlPath,
    @required this.data,
  }) {}
}

class ResponseCallback {
  SuccessCallback successCallback;
  FailureCallback failureCallback;

  ResponseCallback({
    @required this.successCallback,
    @required this.failureCallback,
  });
}

class SuccessData {
  String message;
  int code;
  String data;
}

class FailureData {
  String message;
  String code;
}
