import 'dart:ui';

import 'package:flutter/material.dart';

///
/// PersonalFaceWidget
class PersonalFaceWidget extends StatefulWidget {
  PersonalFaceWidget.defaultStyle({Key? key}) : super(key: key);
  @override
  _PersonalFaceWidgetState createState() => _PersonalFaceWidgetState();
}

class _PersonalFaceWidgetState extends State<PersonalFaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
