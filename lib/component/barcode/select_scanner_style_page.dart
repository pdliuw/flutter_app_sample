import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/barcode/full_screen_scanner_page.dart';

import 'custom_size_scanner_page.dart';

///
/// SelectScannerStylePage
class SelectScannerStylePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectScannerStyleState();
  }
}

///
/// _SelectScannerStyleState
class _SelectScannerStyleState extends State<SelectScannerStylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Scanner Style"),
      ),
      body: Column(
        children: <Widget>[
          Spacer(),
          AppCardOutlinedStyleWidget.defaultStyle(
            onTap: () {
              Airoute.push(route: MaterialPageRoute(builder: (context) {
                return FullScreenScannerPage();
              }));
            },
            child: ListTile(
              leading: Icon(Icons.fullscreen),
              title: Text("FullScreen Style"),
            ),
          ),
          AppCardOutlinedStyleWidget.defaultStyle(
            onTap: () {
              Airoute.push(route: MaterialPageRoute(builder: (context) {
                return CustomSizeScannerPage();
              }));
            },
            child: ListTile(
              leading: Icon(Icons.color_lens_outlined),
              title: Text("CustomSize Style"),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
