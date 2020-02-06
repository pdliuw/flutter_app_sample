import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

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
  String _personalGithub = 'https://github.com/pdliuw/flutter_app_sample';
  String _personalSite = 'https://pdliuw.github.io/';
  String _personalMailto = "xkrossiapd163@163.com";
  @override
  Widget build(BuildContext context) {
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Row(
                    children: <Widget>[
                      Text("我的信息"),
                    ],
                  ),
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
