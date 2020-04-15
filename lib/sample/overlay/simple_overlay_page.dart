import 'dart:ui';

import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/sample/progress/main_progress_page.dart';

///
/// SimpleOverlayPage
class SimpleOverlayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleOverlayState();
  }
}

///
/// _SimpleOverlayState
class _SimpleOverlayState extends State<SimpleOverlayPage> {
  Map<int, Widget> _segmentChildren = {
    1: Text("1"),
    2: Text("2"),
    3: Text("3"),
    4: Text("4"),
    5: Text("5"),
    6: Text("6"),
    7: Text("7"),
    8: Text("8"),
    9: Text("9"),
    10: Text("10"),
  };
  int _segmentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleOverlay"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CupertinoSegmentedControl(
                  padding: EdgeInsets.all(5),
                  children: _segmentChildren,
                  onValueChanged: (int index) {
                    setState(() {
                      _segmentValue = index;
                    });
                  },
                  groupValue: _segmentValue,
                ),
              ),
            ],
          ),
          Align(
            child: Text("$_segmentValue"),
          ),
          Container(
            height: 200,
            child: SimpleOverlay(
              key: GlobalKey(),
              initialEntries: [
                OverlayEntry(
                    opaque: true,
                    builder: (context) {
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(5),
                            child: CircularProgressIndicator(
                              value: (_segmentValue / 10).toDouble(),
                              strokeWidth: 10.0,
                            ),
                          ),
                          Text("${_segmentValue * 10}%"),
                        ],
                      );
                    })
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          Airoute.push(route: SimpleOverlayRoute());
          Airoute.push(
              route: LoadingOverlayRoute(
                  progressValue: (_segmentValue * 10 / 100).toDouble()));
        },
        child: Icon(Icons.slideshow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SimpleOverlayRoute extends OverlayRoute {
  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(
        opaque: false,
        maintainState: false,
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                print("click");
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: GestureDetector(
                    child: MainProgressPage(),
                    onTap: () {
                      print("click in");
                      Airoute.push(
                          route: AwesomeMessageRoute(
                        theme: null,
                        awesomeMessage: AwesomeHelper.createAwesome(title: "内"),
                      ));
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      OverlayEntry(
        opaque: false,
        maintainState: false,
        builder: (context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                print("click");
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: GestureDetector(
                    child: Card(
                      child: AwesomeHelper.createAwesome(
                        title: "title",
                        message: "message",
                        tipType: TipType.COMPLETE,
                      ),
                    ),
                    onTap: () {
                      print("click in");
                      Airoute.push(
                          route: AwesomeMessageRoute(
                        theme: null,
                        awesomeMessage: AwesomeHelper.createAwesome(title: "内"),
                      ));
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ];
  }
}

class SimpleOverlay extends Overlay {
  SimpleOverlay({Key key, List<OverlayEntry> initialEntries})
      : super(key: key, initialEntries: initialEntries);
}

class LoadingOverlayRoute extends OverlayRoute {
  double _progressValue;
  LoadingOverlayRoute({double progressValue}) {
    _progressValue = progressValue;
  }
  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(5),
              child: CircularProgressIndicator(
                value: _progressValue,
                strokeWidth: 10.0,
//                    valueColor: _colorTween,
              ),
            ),
            Text("${_progressValue * 10}%"),
          ],
        );
      }),
    ];
  }
}

class _SimpleOverlayEntry extends OverlayEntry {}
//class SimpleOverlay extends PageRoute {
//  @override
//  Color get barrierColor => Colors.white;
//
//  @override
//  String get barrierLabel => "false";
//
//  @override
//  Widget buildPage(BuildContext context, Animation<double> animation,
//      Animation<double> secondaryAnimation) {
//    return Container(
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
//      color: Colors.transparent,
//      child: AwesomeHelper.createAwesome(),
//    );
//  }
//
//  @override
//  bool get maintainState => true;
//
//  @override
//  Duration get transitionDuration => Duration(milliseconds: 300);
//}
