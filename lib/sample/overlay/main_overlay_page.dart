import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

/// MainOverlayPage
class MainOverlayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainOverlayState();
  }
}

/// _MainOverlayState
class _MainOverlayState extends State<MainOverlayPage> {
  static final Map<String, String> _overlay = {
    //displayName: routeName
    "SimpleOverlay": "/SimpleOverlayPage",
  };

  List<String> _overlayDisplayName = _overlay.keys.toList();

  List<String> _overlayRouteName = _overlay.values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Overlay"),
        ),
        body: ListView.builder(
          itemCount: _overlayDisplayName.length,
          itemBuilder: (context, index) {
            String displayName = _overlayDisplayName.elementAt(index);
            String routeName = _overlayRouteName.elementAt(index);
            return GestureDetector(
              onTap: () {
                Airoute.pushNamedWithAnimation(
                  routeName: routeName,
                  routePageAnimation: AirouteTransition.Slide,
                );
              },
              child: Card(
                  child: ListTile(
                leading: Text("$displayName"),
              )),
            );
          },
        ));
  }
}
