import 'package:flutter/material.dart';

/// WaveTriangleClipper
///
/// 三角形效果的
class WaveTriangleClipper extends CustomClipper<Path> {
  late int _count;
  late bool _isReverse;

  WaveTriangleClipper({
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

      if (_isReverse) {
        if (i % 2 == 1) {
          y = 0;
        } else {
          y = pieceOfHeight;
        }
      } else {
        if (i % 2 == 1) {
          y = pieceOfHeight;
        } else {
          y = 0;
        }
      }
      path.lineTo(pieceOfWidth * (i + 1), y);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
