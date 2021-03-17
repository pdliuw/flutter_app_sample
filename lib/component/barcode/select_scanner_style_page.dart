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
      body: Row(
        children: <Widget>[
          Spacer(),
          Column(
            children: <Widget>[
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Airoute.push(route: MaterialPageRoute(builder: (context) {
                    return FullScreenScannerPage();
                  }));
                },
                child: Text("FullScreen Style"),
                textTheme: ButtonTextTheme.accent,
              ),
              RaisedButton(
                onPressed: () {
                  Airoute.push(route: MaterialPageRoute(builder: (context) {
                    return CustomSizeScannerPage();
                  }));
                },
                child: Text("CustomSize Style"),
                textTheme: ButtonTextTheme.accent,
              ),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
