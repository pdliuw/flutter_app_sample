import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// DartpadPage
class DartpadPage extends StatefulWidget {
  const DartpadPage({Key? key}) : super(key: key);

  @override
  State<DartpadPage> createState() => _DartpadPageState();
}

class _DartpadPageState extends State<DartpadPage> {
  @override
  Widget build(BuildContext context) {
    var iframe = html.IFrameElement();
    iframe.height = '500';
    iframe.width = '500';
    iframe.src = "https://dartpad.dev/embed-inline.html?id=5d70bc1889d055c7a18d35d77874af88&split=80&theme=dark";
    iframe.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('dartpad.dev/embed-inline.html', (int viewId) => iframe);

    return Scaffold(
      appBar: AppBar(),
      body: HtmlElementView(key: UniqueKey(), viewType: "dartpad.dev/embed-inline.html"),
    );
  }
}
