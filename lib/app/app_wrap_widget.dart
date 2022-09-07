import 'package:flutter/material.dart';

import 'export_app_component_file.dart';

/// AppWrapWidget
class AppWrapWidget extends StatefulWidget {
  final Widget app;

  const AppWrapWidget({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<AppWrapWidget> createState() => _AppWrapWidgetState();
}

class _AppWrapWidgetState extends State<AppWrapWidget> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Stack(
        children: [
          Positioned.fill(child: widget.app),
          ValueListenableBuilder<bool>(
              valueListenable: AppGlobalModel.instance.clockNotifier,
              builder: (context, show, child) {
                return Positioned.fill(
                    child: show ? AppFloatingClock() : Container());
              }),
        ],
      ),
    );
  }
}
