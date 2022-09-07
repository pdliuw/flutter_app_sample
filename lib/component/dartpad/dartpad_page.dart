import 'dart:html' deferred as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// DartpadPage
class DartpadPage extends StatefulWidget {
  const DartpadPage({Key? key}) : super(key: key);

  @override
  State<DartpadPage> createState() => _DartpadPageState();
}

class _DartpadPageState extends State<DartpadPage> {
  ValueNotifier<int> _navigationNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: html.loadLibrary(),
          builder: (context, data) {
            final List<HtmlElementView> elementList = [];

            // ignore: undefined_prefixed_name
            ui.platformViewRegistry.registerViewFactory(
                'dartpad.dev/embed-inline.html', (int viewId) {
              var iframe = html.IFrameElement();
              iframe.height = '500';
              iframe.width = '500';
              iframe.src =
                  "https://dartpad.dev/embed-inline.html?id=5d70bc1889d055c7a18d35d77874af88&split=80&theme=dark";
              iframe.style.border = 'none';
              return iframe;
            });
            elementList.add(HtmlElementView(
                key: UniqueKey(), viewType: "dartpad.dev/embed-inline.html"));

            // ignore: undefined_prefixed_name
            ui.platformViewRegistry.registerViewFactory(
                'dartpad.dev/embed-flutter.html', (int viewId) {
              var iframe = html.IFrameElement();
              iframe.height = '500';
              iframe.width = '500';
              iframe.src =
                  "https://dartpad.dev/embed-flutter.html?id=e75b493dae1287757c5e1d77a0dc73f1&split=80&theme=dark";
              iframe.style.border = 'none';
              return iframe;
            });
            elementList.add(HtmlElementView(
                key: UniqueKey(), viewType: "dartpad.dev/embed-flutter.html"));

            // ignore: undefined_prefixed_name
            ui.platformViewRegistry.registerViewFactory(
                'dartpad.dev/embed-html.html', (int viewId) {
              var iframe = html.IFrameElement();
              iframe.height = '500';
              iframe.width = '500';
              iframe.src =
                  "https://dartpad.dev/embed-html.html?id=&split=80&theme=dark";
              iframe.style.border = 'none';
              return iframe;
            });
            elementList.add(HtmlElementView(
                key: UniqueKey(), viewType: "dartpad.dev/embed-html.html"));

            return ValueListenableBuilder<int>(
                valueListenable: _navigationNotifier,
                builder: (context, value, child) {
                  return Row(
                    children: [
                      NavigationRail(
                        destinations: [
                          NavigationRailDestination(
                              icon: Image.asset(
                                "assets/dart-192.png",
                                width: 24,
                                height: 24,
                              ),
                              label: Text("Dart")),
                          NavigationRailDestination(
                              icon: Image.asset(
                                "assets/dart-192.png",
                                width: 24,
                                height: 24,
                              ),
                              label: Text("Flutter")),
                          NavigationRailDestination(
                              icon: Image.asset(
                                "assets/dart-192.png",
                                width: 24,
                                height: 24,
                              ),
                              label: Text("Html")),
                        ],
                        labelType: NavigationRailLabelType.all,
                        selectedIndex: value,
                        onDestinationSelected: (int index) {
                          _navigationNotifier.value = index;
                        },
                      ),
                      Expanded(child: elementList.elementAt(value)),
                    ],
                  );
                });
          }),
    );
  }
}
