import 'package:flutter/material.dart';

///
/// InkPage
class InkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InkState();
  }
}

class _InkState extends State<InkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ink'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.5,
              child: Ink.image(
                image: AssetImage('assets/avatar.jpg'),
                fit: BoxFit.cover,
                child: InkWell(
                  splashColor: Colors.greenAccent,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      '1、长按我出现水波纹（覆盖）',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Ink(
              height: 300,
              width: 300,
              color: Colors.red,
              child: InkWell(
                splashColor: Colors.greenAccent,
                onTap: () {},
                child: Center(
                  child: Text(
                    '2、长按我出现水波纹（覆盖）',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ),
            Divider(),
            Ink(
              height: 300,
              width: 300,
              color: Colors.red,
              child: InkWell(
                splashColor: Colors.white30,
                onTap: () {},
                child: Center(
                  child: Text(
                    '3、长按我出现水波纹（半透明）',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ),
            Divider(),
            AspectRatio(
              aspectRatio: 1.5,
              child: Ink.image(
                image: AssetImage('assets/avatar.jpg'),
                fit: BoxFit.cover,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      '4、长按我出现水波纹（前景）',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Ink.image(
              image: AssetImage('assets/avatar.jpg'),
              height: 250,
              width: 400,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: Colors.white30,
                onTap: () {},
                child: Center(
                  child: Text(
                    '5、长按我出现水波纹（半透明）',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
