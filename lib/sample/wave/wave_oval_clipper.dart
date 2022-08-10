import 'package:flutter/material.dart';

/// WaveOvalClipper
///
/// 椭圆效果的
class WaveOvalClipper extends CustomClipper<Path> {
  late int _count;
  late bool _isReverse;

  WaveOvalClipper({
    required int waveCount,
    bool isReverse = false,
  }) {
    _count = waveCount;
    _isReverse = isReverse;
  }

  @override
  Path getClip(Size size) {
    var path = Path();

    var _segment = _count * 2;

    double pieceOfWidth = size.width / _segment;
    double pieceOfHeight = size.height;

    if (_isReverse) {
      path.moveTo(0, 0);
    } else {
      path.moveTo(0, pieceOfHeight);
    }

    for (int i = 0; i < _segment; i++) {
      double y = 0.0;

      double left;
      double top;
      double right;
      double bottom;

      double startAngle;
      double sweepAngle;

      if (_isReverse) {
        if (i % 2 == 1) {
          y = 0;
          left = pieceOfWidth * i;
          top = y;
        } else {
          y = pieceOfHeight;
          left = pieceOfWidth * i;
          top = y;
        }
      } else {
        if (i % 2 == 1) {
          y = pieceOfHeight;
          left = pieceOfWidth * i;
          top = y;
          startAngle = 180;
          sweepAngle = -45;
        } else {
          y = 0;
          left = pieceOfWidth * i;
          top = y;
          startAngle = 180;
          sweepAngle = 45;
        }
      }
      Rect rect = Rect.fromLTRB(left, top, left + pieceOfWidth, top + pieceOfHeight);
      path.addOval(rect);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
