import 'package:air_design/air_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/personal/personal_face_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/helper/tip_helper.dart';
import '../../common/helper/tip_type.dart';

///
/// UserInfoPage
class UserInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserInfoState();
  }
}

///
/// _UserInfoState
class _UserInfoState extends State<UserInfoPage> {
  String _phoneNumber = '12345678910';
  String _birthday = '日期';
  String _personalGithub = 'https://github.com/pdliuw/flutter_app_sample';
  String _personalSite = 'https://pdliuw.github.io/';
  String _personalMailto = "xkrossiapd163@163.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Banner(
                    message: "air",
                    color: Colors.green,
                    location: BannerLocation.topEnd,
                    child: AppCardElevatedStyleWidget.defaultStyle(
                      child: PersonalFaceWidget.defaultStyle(),
                    ),
                  ),
                  ExpansionTile(
                    title: Row(
                      children: <Widget>[
                        Text("联系方式"),
                      ],
                    ),
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          _launchURL(url: '$_personalGithub');
                        },
                        leading: Icon(Icons.web),
                        title: Text('Github'),
                        subtitle: Text("立即查看"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        onTap: () {
                          _showCupertinoDatePicker(
                              context: context,
                              changed: (DateTime dateTime) {
                                setState(() {
                                  _birthday =
                                      "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                                });
                              });
                        },
                        leading: Icon(Icons.update),
                        title: Text('$_birthday'),
                        subtitle: Text("立即选择"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        onTap: () {
                          _launchMailto(mailto: '$_personalMailto');
                        },
                        leading: Icon(Icons.mail_outline),
                        title: Text('Email'),
                        subtitle: Text("立即查看"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        onTap: () {
                          _launchURL(url: '$_personalGithub');
                        },
                        leading: Icon(Icons.call),
                        title: Text('$_phoneNumber'),
                        subtitle: Text("立即查看"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        onTap: () {
                          _launchSms(phone: '$_phoneNumber');
                        },
                        leading: Icon(Icons.sms),
                        title: Text('$_phoneNumber'),
                        subtitle: Text("立即查看"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                ],
              ),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }

  _showBirthday({
    Function(String birthday) onChange,
  }) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: YearPicker(
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now(),
                    selectedDate: DateTime.now(),
                    onChanged: (DateTime dateTime) {},
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showCupertinoDatePicker({
    @required BuildContext context,
    @required Function(DateTime dateTime) changed,
  }) {
    DateTime nowTime = DateTime.now();
    DateTime cacheDateTime = nowTime;
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (DateTime dateTime) {
        print("the date is ${dateTime.toString()}");
        cacheDateTime = dateTime;
        changed(dateTime);
      },
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      mode: CupertinoDatePickerMode.date,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );

    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  child: Flexible(
                    flex: 1,
                    child: picker,
                  ),
                ),
              ],
            ),
          );
        });
  }

  _launchMailto({
    String mailto = '12345678910',
  }) async {
    mailto = '$mailto';
    await launch('mailto:$mailto');
  }

  _launchSms({
    String phone = '12345678910',
  }) async {
    phone = '$phone';
    await launch('sms:$phone');
  }

  _launchPhone({
    String phone,
  }) async {
    await launch('tel:$phone');
  }

  _launchURL({
    String url = 'https://flutter.dev',
  }) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      TipHelper.showTip(
        context: context,
        tipType: TipType.ERROR,
        message: 'Error url:$url',
      );
    }
  }
}
