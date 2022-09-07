import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/helper/tip_helper.dart';
import 'package:flutter_app_sample/component/personal/personal_face_widget.dart';

///
/// SettingPage
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        var landscape = orientation == Orientation.landscape;

        return Flex(
          direction: landscape ? Axis.horizontal : Axis.vertical,
          children: [
            AppCardElevatedStyleWidget.defaultStyle(
              child: PersonalFaceWidget.defaultStyle(),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  AppCardOutlinedStyleWidget.defaultStyle(
                    onTap: () {
                      setState(() {
                        TipHelper.showTip(
                            context: context, message: "努力开发中...");
                      });
                    },
                    child: ListTile(
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
                  ),
                  AppCardOutlinedStyleWidget.defaultStyle(
                    onTap: () {
                      Airoute.pushNamed(
                        routeName: "/AirLicensePage",
                      );
                    },
                    child: ListTile(
                      leading: Text("版权/证书"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  AppCardOutlinedStyleWidget.defaultStyle(
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
                                    Airoute.pushNamedAndRemoveUntil(
                                        newRouteName: "/LoginPage");
                                  },
                                  child: Text("确定"),
                                ),
                              ],
                            );
                          });
                    },
                    child: ListTile(
                      leading: Text("退出登陆"),
                      trailing: Icon(Icons.exit_to_app),
                    ),
                  ),
                ],
              ),
            ))
          ],
        );
      }),
    );
  }
}
