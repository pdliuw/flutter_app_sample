import 'dart:ui';

import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/helper/tip_helper.dart';
import 'package:flutter_app_sample/global_view_model.dart';

/// PersonalSlideDrawer
class PersonalSlideDrawer extends StatefulWidget {
  late bool _leftDraw;

  PersonalSlideDrawer({
    bool leftDraw = true,
  }) {
    _leftDraw = leftDraw;
  }

  @override
  State<StatefulWidget> createState() {
    return _PersonalSlideState(_leftDraw);
  }
}

class _PersonalSlideState extends State<PersonalSlideDrawer> {
  late bool leftDraw;
  late bool _drawerOpenedRight;
  _PersonalSlideState(bool isLeftDraw) {
    leftDraw = isLeftDraw;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Airoute.pushNamed(routeName: "/UserInfoPage");
              },
              child: Container(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/avatar.jpg",
                        fit: BoxFit.cover,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          width: 1,
                          height: 1,
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/avatar.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              child: Text(
                                "Air",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text("个人中心"),
              onTap: () {
                Airoute.pushNamed(routeName: "/UserInfoPage");
              },
              trailing: Icon(Icons.arrow_right),
            ),
//            Divider(),
//            ListTile(
//              leading: Icon(
//                Icons.more_horiz,
//                color: Colors.blue,
//              ),
//              title: Text("更多功能"),
//              subtitle: Text(
//                "紧急上线中...",
//              ),
//              onTap: () {
//                TipHelper.showTip(
//                    context: context,
//                    tipType: TipType.WARN,
//                    message: "紧急上线中...");
//              },
//              trailing: Icon(Icons.arrow_right),
//            ),
            Divider(),
            ExpansionTile(
              title: Text("小标签"),
              children: <Widget>[
                Wrap(
                  spacing: 10,
                  children: <Widget>[
                    Chip(
                      avatar: ClipOval(
                        child: Image.asset("assets/avatar.jpg"),
                      ),
                      label: Text("Air"),
                    ),
                    Chip(
                      avatar: ClipOval(
                        child: Image.asset("assets/avatar.jpg"),
                      ),
                      label: Text("男"),
                    ),
                    Chip(
                      avatar: Icon(
                        Icons.date_range,
                        color: Colors.green[300],
                      ),
                      label: Text("2020"),
                    ),
                    Chip(
                      avatar: Icon(
                        Icons.face,
                        color: Colors.blue[300],
                      ),
                      label: Container(
                        width: 25,
                        height: 25,
                        child: ClipOval(
                          child: Image.asset("assets/avatar.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text("小工具"),
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    IgnorePointer(
                      ignoring: (!leftDraw && _drawerOpenedRight),
                      child: (!leftDraw && _drawerOpenedRight)
                          ? ColorFiltered(
                              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                              child: ListTile(
                                onTap: () {
//                                  _setState(!_drawerOpenedRight);
                                },
                                leading: Text("开启右侧侧滑"),
                                trailing: Switch(
                                  value: _drawerOpenedRight,
                                  onChanged: (bool value) {
//                                    _setState(value);
                                  },
                                ),
                              ),
                            )
                          : ListTile(
                              onTap: () {
//                                _setState(!_drawerOpenedRight);
                              },
                              leading: Text("开启右侧侧滑"),
                              trailing: Switch(
                                value: _drawerOpenedRight,
                                onChanged: (bool value) {
//                                  _setState(value);
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text("样式"),
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        setState(() {
                          GlobalViewModel.getInstance().toggleDarkThemeMode();
                        });
                      },
                      leading: Text("Dark"),
                      title: Text("Dark"),
                      subtitle: Text("暗色模式"),
                      trailing: Switch(
                        value: GlobalViewModel.getInstance().isDarkTheme,
                        onChanged: (bool value) {
                          setState(() {
                            GlobalViewModel.getInstance().toggleDarkThemeMode();
                          });
                        },
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          GlobalViewModel.getInstance().toggleLightThemeMode();
                        });
                      },
                      leading: Text("Light"),
                      title: Text("Light"),
                      subtitle: Text("浅色模式"),
                      trailing: Switch(
                        value: GlobalViewModel.getInstance().isLightTheme,
                        onChanged: (bool value) {
                          setState(() {
                            GlobalViewModel.getInstance().toggleLightThemeMode();
                          });
                        },
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          GlobalViewModel.getInstance().toggleSystemThemeMode();
                        });
                      },
                      leading: Text("System"),
                      title: Text("System"),
                      subtitle: Text("跟随系统"),
                      trailing: Switch(
                        value: GlobalViewModel.getInstance().isSystemTheme,
                        onChanged: (bool value) {
                          setState(() {
                            GlobalViewModel.getInstance().toggleSystemThemeMode();
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
            ExpansionTile(
              title: Text("敏感项"),
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    ListTile(
                        onTap: () {
                          setState(() {
                            TipHelper.showTip(context: context, message: "努力开发中...");
                          });
                        },
                        title: Text("常亮"),
                        trailing: IgnorePointer(
                          ignoring: true,
                          child: Switch(
                            value: false,
                            onChanged: (bool value) {
                              setState(() {});
                            },
                          ),
                        )),
                    ListTile(
                      onTap: () {
                        Airoute.pushNamed(
                          routeName: "/AirLicensePage",
                        );
                      },
                      leading: Text("版权/证书"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: Text("退出登陆"),
                                content: Text("确定退出登陆"),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Airoute.pop();
                                    },
                                    child: Text("取消"),
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Airoute.pushNamedAndRemoveUntil(newRouteName: "/LoginPage");
                                    },
                                    child: Text("确定"),
                                  ),
                                ],
                              );
                            });
                      },
                      leading: Text("退出登陆"),
                      trailing: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
