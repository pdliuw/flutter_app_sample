import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/app/export_app_component_file.dart';
import 'package:flutter_app_sample/component/personal/personal_config.dart';
import 'package:flutter_app_sample/component/personal/personal_face_widget.dart';
import 'package:flutter_app_sample/global_view_model.dart';

///
/// Personal drawer widget
class PersonalDrawerWidget extends StatefulWidget {
  @override
  _PersonalDrawerWidgetState createState() => _PersonalDrawerWidgetState();
}

class _PersonalDrawerWidgetState extends State<PersonalDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: AppCardOutlinedStyleWidget.defaultStyle(
            onTap: () {
              Airoute.pushNamed(routeName: "/UserInfoPage");
            },
            child: PersonalFaceWidget.defaultStyle(),
          ),
          top: true,
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
        Divider(),
        ExpansionTile(
          title: Text("小标签"),
          children: <Widget>[
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                for (int labelIndex = 0,
                        labelSize = PersonalConfig.personalLabelConfig.length;
                    labelIndex < labelSize;
                    labelIndex++)
                  Chip(
                    avatar: PersonalConfig.personalLabelConfig[labelIndex]
                        ['avatar']['widget'],
                    label: PersonalConfig.personalLabelConfig[labelIndex]
                        ['label']['widget'],
                  ),
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: Text("小工具"),
          children: <Widget>[
            for (int toolIndex = 0,
                    toolSize = PersonalConfig.personalToolConfig.length;
                toolIndex < toolSize;
                toolIndex++)
              ListTile(
                onTap: () {
                  Airoute.pushNamed(
                      routeName:
                          "${PersonalConfig.personalToolConfig[toolIndex]['routeName']}");
                },
                leading: PersonalConfig.personalToolConfig[toolIndex]['avatar']
                    ['widget'],
                title: AppTextSubtitle1Widget.defaultStyle(
                    data:
                        "${PersonalConfig.personalToolConfig[toolIndex]['title']}"),
                subtitle: AppTextBodyText2Widget.defaultStyle(
                    data:
                        "${PersonalConfig.personalToolConfig[toolIndex]['subtitle']}"),
                trailing: Icon(Icons.arrow_right),
              )
          ],
        ),
        ExpansionTile(
          title: Text("外观"),
          children: <Widget>[
            Wrap(
              children: <Widget>[
                ListTile(
                  selected: GlobalViewModel.instance.isLightTheme,
                  onTap: () {
                    setState(() {
                      GlobalViewModel.instance.toggleLightThemeMode();
                    });
                  },
                  leading: Icon(Icons.wb_sunny),
                  title: Text("浅色"),
                  subtitle: Text("浅色模式"),
                  trailing: Switch(
                    value: GlobalViewModel.instance.isLightTheme,
                    onChanged: (bool value) {
                      setState(() {
                        GlobalViewModel.instance.toggleLightThemeMode();
                      });
                    },
                  ),
                ),
                ListTile(
                  selected: GlobalViewModel.instance.isDarkTheme,
                  onTap: () {
                    setState(() {
                      GlobalViewModel.instance.toggleDarkThemeMode();
                    });
                  },
                  leading: Icon(Icons.nightlight_round),
                  title: Text("深色"),
                  subtitle: Text("深色模式"),
                  trailing: Switch(
                    value: GlobalViewModel.instance.isDarkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        GlobalViewModel.instance.toggleDarkThemeMode();
                      });
                    },
                  ),
                ),
                ListTile(
                  selected: GlobalViewModel.instance.isSystemTheme,
                  onTap: () {
                    setState(() {
                      GlobalViewModel.instance.toggleSystemThemeMode();
                    });
                  },
                  leading: Icon(Icons.brightness_auto),
                  title: Text("系统"),
                  subtitle: Text("跟随系统"),
                  trailing: Switch(
                    value: GlobalViewModel.instance.isSystemTheme,
                    onChanged: (bool value) {
                      setState(() {
                        GlobalViewModel.instance.toggleSystemThemeMode();
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
        Divider(),
        ValueListenableBuilder<bool>(
            valueListenable: AppGlobalModel.instance.clockNotifier,
            builder: (context, show, child) {
              return SwitchListTile(
                value: show,
                title: AppTextSubtitle1Widget.defaultStyle(data: "时钟"),
                subtitle: AppTextBodyText2Widget.defaultStyle(
                  data: "时钟已${show ? '开启' : '关闭'}",
                ),
                onChanged: (checked) {
                  AppGlobalModel.instance.clockNotifier.value = checked;
                },
              );
            }),
        ListTile(
          onTap: () {
            Airoute.pushNamed(routeName: "/SettingPage");
          },
          leading: Icon(Icons.settings),
          title: AppTextSubtitle1Widget.defaultStyle(data: "设置"),
          subtitle: AppTextBodyText2Widget.defaultStyle(data: "去设置"),
          trailing: Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
