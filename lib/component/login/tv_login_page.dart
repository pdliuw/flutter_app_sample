import 'dart:ui';

import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/util/StringUtil.dart';
import 'package:flutter_app_sample/tv/app_raw_key_board_listener_widget.dart';

///登陆页面
///
///针对IOS和Android设备制定不同的设计
///1、逻辑：账号/手机号+验证码/密码的形势执行登陆操作！
///2、提示：账号/手机号为"11位"，验证码/密码位"6"位！
///5、平台：IOS平台没有"退出"按钮，Android平台有"退出"按钮！
///适配：TV（遥控器操作界面）交互
class TvLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

///
/// _LoginState
class _LoginState extends State<TvLoginPage> {
  static const num PHONE_MAX_LENGTH_DEFAULT = 11;
  static const num VERIFICATION_MAX_LENGTH_DEFAULT = 16;
  String phoneStr = "";
  String passwordStr = "";
  String verificationStr = "";

  ///
  /// FocusNode
  List<FocusNode> _focusNodeList = [];
  final int initialNodeListLength = 3;
  bool isFirstIn = true;

  @override
  void initState() {
    super.initState();

    for (int i = 0, size = initialNodeListLength; i < size; i++) {
      _focusNodeList.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < _focusNodeList.length; i++) {
      _focusNodeList[i].dispose();
    }
    super.dispose();
    //Presenter.
  }

  String _getPhoneErrorInfo() {
    if (StringUtil.isEmpty(phoneStr) ||
        phoneStr.length == PHONE_MAX_LENGTH_DEFAULT) {
      return StringUtil.getEmpty;
    } else {
      return "请输入11位帐号";
    }
  }

  String _getPasswordErrorInfo() {
    if (StringUtil.isEmpty(passwordStr) ||
        passwordStr.length == VERIFICATION_MAX_LENGTH_DEFAULT) {
      return StringUtil.getEmpty;
    } else {
      return "请输入16位密码";
    }
  }

  _phoneInputChange(String content) {
    setState(() {
      phoneStr = content;
    });
  }

  _passwordInputChange(String content) {
    setState(() {
      passwordStr = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstIn) {
      FocusScope.of(context).requestFocus(_focusNodeList[0]);
      isFirstIn = false;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double contentWidth = width / 3 * 2;
    double contentHeight = height / 3 * 2;

    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Image.asset(
              "assets/login_top_gif.gif",
              fit: BoxFit.fill,
              height: height,
              width: width,
            ),
          ),
          Positioned(
            left: contentWidth / 10,
            top: contentHeight / 10,
            right: contentWidth / 10,
            bottom: contentHeight / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppRawKeyboardListenerWidget.defaultStyle(
                  focusList: _focusNodeList,
                  focusIndex: 0,
                  onTap: () {},
                  onTelevisionTap: () {},
                  onKey: (event) {
                    setState(() {});
                  },
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryIconTheme.color,
                      labelText: '帐号',
                      hintText: "请输入帐号",
                      errorText: _getPhoneErrorInfo(),
                      helperText: "helper",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    textAlign: TextAlign.start,
                    enabled: true,
                    maxLength: PHONE_MAX_LENGTH_DEFAULT,
                    onChanged: (String content) {
                      _phoneInputChange(content);
                    },
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    AppRawKeyboardListenerWidget.defaultStyle(
                      focusList: _focusNodeList,
                      focusIndex: 1,
                      onTelevisionTap: () {},
                      onTap: () {},
                      onKey: (event) {
                        setState(() {});
                      },
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).primaryIconTheme.color,
                          labelText: '密码',
                          hintText: "请输入密码",
                          errorText: _getPasswordErrorInfo(),
                          helperText: "helper",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textAlign: TextAlign.start,
                        enabled: true,
                        maxLength: VERIFICATION_MAX_LENGTH_DEFAULT,
                        onChanged: (String content) {
                          _passwordInputChange(content);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      child: AppRawKeyboardListenerWidget.defaultStyle(
                        focusList: _focusNodeList,
                        focusIndex: 2,
                        onTap: () {},
                        onTelevisionTap: () {
                          Airoute.pushNamed(routeName: "/TvMainPage");
                        },
                        onKey: (event) {
                          setState(() {});
                        },
                        child: RawMaterialButton(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          animationDuration: Duration(seconds: 3),
                          onPressed: () {
                            Airoute.pushNamed(routeName: "/TvMainPage");
                          },
                          fillColor: Theme.of(context).primaryColor,
                          child: Text(
                            "登陆",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Theme.of(context)
                                        .primaryIconTheme
                                        .color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
