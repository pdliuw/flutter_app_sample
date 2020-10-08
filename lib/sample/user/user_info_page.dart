import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String _birthday = '';
  String _personalGithub = 'https://github.com/pdliuw/flutter_app_sample';
  String _personalSite = 'https://pdliuw.github.io/';
  String _personalMailto = "xkrossiapd163@163.com";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Banner(
                      message: "air",
                      color: Colors.green,
                      location: BannerLocation.topEnd,
                      child: Container(
                        child: Image.asset(
                          "assets/avatar.jpg",
                          fit: BoxFit.fill,
                          width: width,
                          height: height / 3 * 2,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Row(
                    children: <Widget>[
                      Text("联系方式"),
                    ],
                  ),
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        FlatButton.icon(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _launchURL(url: '$_personalGithub');
                          },
                          icon: Icon(Icons.web),
                          label: Text('Github'),
                        ),
                        FlatButton.icon(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _showCupertinoDatePicker(
                                context: context,
                                changed: (DateTime dateTime) {
                                  setState(() {
                                    _birthday =
                                        "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                                  });
                                });
                          },
                          icon: Icon(Icons.update),
                          label: Text('$_birthday'),
                        ),
                        FlatButton.icon(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _launchMailto(mailto: '$_personalMailto');
                          },
                          icon: Icon(Icons.mail_outline),
                          label: Text('Email'),
                        ),
                        FlatButton.icon(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _launchPhone(phone: '$_phoneNumber');
                          },
                          icon: Icon(Icons.call),
                          label: Text('$_phoneNumber'),
                        ),
                        FlatButton.icon(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _launchSms(phone: '$_phoneNumber');
                          },
                          icon: Icon(Icons.sms),
                          label: Text('$_phoneNumber'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: BackButton(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
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
