import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'key_code.dart';

///
/// AppRawKeyboardListenerWidget
class AppRawKeyboardListenerWidget extends StatefulWidget {
  final List<FocusNode> focusList;
  final int focusIndex;
  final Widget child;
  final VoidCallback onTelevisionTap;
  final VoidCallback onTap;
  final ValueChanged<RawKeyEvent>? onKey;
  AppRawKeyboardListenerWidget.defaultStyle({
    required this.focusList,
    required this.focusIndex,
    required this.child,
    required this.onTelevisionTap,
    required this.onTap,
    this.onKey,
  }) {}
  @override
  _AppRawKeyboardListenerWidgetState createState() => _AppRawKeyboardListenerWidgetState();
}

class _AppRawKeyboardListenerWidgetState extends State<AppRawKeyboardListenerWidget> {
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: widget.focusList[widget.focusIndex],
      child: AppCardOutlinedStyleWidget.defaultStyle(
        onTap: widget.onTap,
        checked: widget.focusList[widget.focusIndex].hasFocus,
        child: widget.child,
      ),
      onKey: (RawKeyEvent event) {
        if (event == null) {
          return;
        }
        if (event is RawKeyDownEvent && event.data is RawKeyEventDataAndroid) {
          RawKeyDownEvent rawKeyDownEvent = event;
          RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data as RawKeyEventDataAndroid;
          print("tv launcher sample ${rawKeyEventDataAndroid.keyCode}");
          switch (rawKeyEventDataAndroid.keyCode) {
            case KEY_CENTER:
              if (widget.onTelevisionTap != null) {
                widget.onTelevisionTap();
              }
              break;
            case KEY_UP:
              if (widget.focusIndex == 0) {
              } else {
                FocusScope.of(context).requestFocus(widget.focusList[widget.focusIndex - 1]);
              }
              break;
            case KEY_DOWN:
              if (widget.focusIndex == (widget.focusList.length - 1)) {
              } else {
                FocusScope.of(context).requestFocus(widget.focusList[widget.focusIndex + 1]);
              }
              break;
            default:
              break;
          }
          //callback
          if (widget.onKey != null) {
            widget.onKey!(event);
          }
        }
      },
    );
  }
}
