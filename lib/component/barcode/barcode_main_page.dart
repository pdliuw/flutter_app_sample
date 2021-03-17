import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/barcode/select_scanner_style_page.dart';

import 'creator_page.dart';

///
/// BarcodeMainPage
class BarcodeMainPage extends StatefulWidget {
  @override
  _BarcodeMainPageState createState() => _BarcodeMainPageState();
}

class _BarcodeMainPageState extends State<BarcodeMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("条码"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AppCardOutlinedStyleWidget.defaultStyle(
              onTap: () {
                //跳转页面=扫描二维码
                Airoute.push(route: MaterialPageRoute(builder: (context) {
                  return SelectScannerStylePage();
                }));
              },
              child: Center(
                child: AppCardElevatedStyleWidget.defaultStyle(
                  child: Text("Scan 1D barcode/QR code"),
                ),
              ),
            ),
          ),
          Expanded(
            child: AppCardOutlinedStyleWidget.defaultStyle(
              onTap: () {
                //跳转页面=生成二维码
                Airoute.push(route: MaterialPageRoute(builder: (context) {
                  return CreatorPage();
                }));
              },
              child: Center(
                child: AppCardElevatedStyleWidget.defaultStyle(
                  child: Text("Create QR code"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
