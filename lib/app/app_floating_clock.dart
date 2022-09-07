import 'dart:math' as math;

import 'package:ai_clock/ai_clock.dart';
import 'package:flutter/material.dart';

/// AppFloatingClock
class AppFloatingClock extends StatefulWidget {
  const AppFloatingClock({Key? key}) : super(key: key);

  @override
  State<AppFloatingClock> createState() => _AppFloatingClockState();
}

class _AppFloatingClockState extends State<AppFloatingClock> {
  double downDx = 0.0;
  double downDy = 0.0;
  double preMarginLeft = 0.0;
  double preMarginTop = 0.0;

  final ValueNotifier<Offset> _dragMoveNotifier =
      ValueNotifier(Offset(0.0, 0.0));
  final ValueNotifier<bool> _dragMovingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final double maxHeight = constraints.maxHeight;
      return GestureDetector(
        onTap: () {},
        onHorizontalDragDown: (details) {
          downDx = details.localPosition.dx;
          _dragMovingNotifier.value = true;
        },
        onHorizontalDragUpdate: (details) {
          double moveDx = details.localPosition.dx - downDx;
          Offset nowOffset = _dragMoveNotifier.value;
          _dragMoveNotifier.value = Offset(moveDx, nowOffset.dy);
        },
        onHorizontalDragEnd: (details) {
          preMarginLeft = preMarginLeft + _dragMoveNotifier.value.dx;
          _dragMovingNotifier.value = false;
        },
        onVerticalDragDown: (details) {
          downDy = details.localPosition.dy;
          _dragMovingNotifier.value = true;
        },
        onVerticalDragUpdate: (details) {
          double moveDy = details.localPosition.dy - downDy;
          Offset nowOffset = _dragMoveNotifier.value;
          _dragMoveNotifier.value = Offset(nowOffset.dx, moveDy);
        },
        onVerticalDragEnd: (details) {
          preMarginTop = preMarginTop + _dragMoveNotifier.value.dy;
          _dragMovingNotifier.value = false;
        },
        child: Stack(
          children: [
            ValueListenableBuilder<Offset>(
                valueListenable: _dragMoveNotifier,
                builder: (context, data, child) {
                  final double moveDx = data.dx;
                  final double moveDy = data.dy;

                  const double clockWidth = 200;
                  const double clockHeight = 200;

                  double left = preMarginLeft + moveDx;
                  left = math.max(0, left);
                  left = math.min(left, maxWidth - clockWidth);

                  double top = preMarginTop + moveDy;
                  top = math.max(0, top);
                  top = math.min(top, maxHeight - clockHeight);

                  return Positioned(
                    left: left,
                    top: top,
                    child: ValueListenableBuilder<bool>(
                        valueListenable: _dragMovingNotifier,
                        builder: (context, moving, child) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              boxShadow: moving
                                  ? <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.green,
                                        spreadRadius: 10,
                                        blurRadius: 10,
                                        offset: Offset.zero,
                                      ),
                                    ]
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: clockWidth,
                              height: clockHeight,
                              child: AiClock(),
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      );
    });
  }
}
