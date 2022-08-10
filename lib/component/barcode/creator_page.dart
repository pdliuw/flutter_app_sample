import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/material.dart';

///
/// CreatorPage
/// 生成：二维码
class CreatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatorState();
  }
}

///
/// _CreatorState
class _CreatorState extends State<CreatorPage> {
  String _qrCodeOfInput = "请输入二维码信息";

  late CreatorController _creatorController;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _creatorController = CreatorController();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("生成 二维码"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "请输入要生成的二维码信息",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.info),
                    ),
                    onChanged: (String inputValue) {
                      _qrCodeOfInput = inputValue;
                    },
                  ),
                ),
              ],
            ),
            RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  //update value
                  _creatorController.updateValue(
                    value: _qrCodeOfInput,
                  );
                });
              },
              icon: Icon(Icons.create),
              label: Text("生成二维码"),
            ),
            Column(
              children: <Widget>[
                Text("生成的二维码：$_qrCodeOfInput"),
                Container(
                  width: 300,
                  height: 300,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blue,
                        width: 15,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.all(40),
                  child: PlatformAiBarcodeCreatorWidget(
                    creatorController: _creatorController,
                    initialValue: "$_qrCodeOfInput",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
