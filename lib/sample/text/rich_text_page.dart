import 'package:flutter/material.dart';

///
/// RichTextPage
class RichTextPage extends StatefulWidget {
  final String _richTextMessage = "@Air 你好";

  @override
  State<StatefulWidget> createState() {
    return _RichTextState();
  }
}

///
/// _RichTextState
class _RichTextState extends State<RichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RichText"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.5,
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [],
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Hello richText",
                      style: _getTextStyleDefaulted(),
                      children: <InlineSpan>[
                        TextSpan(text: "bold text", style: _getTextStyleDefaulted()),
                        WidgetSpan(child: Icon(Icons.print)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// 获取自定义文本样式
  TextStyle _getTextStyleDefaulted() {
    return TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }
}
