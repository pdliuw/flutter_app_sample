import 'package:flutter/material.dart';

/// SliderPage
class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final ValueNotifier<double> _sliderValue = ValueNotifier(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return Slider(
                    min: 0,
                    max: 1,
                    value: value,
                    onChanged: (value) {
                      _sliderValue.value = value;
                    });
              }),
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: const RoundSliderOverlayShape(),
                    thumbShape: const RoundSliderThumbShape(),
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    min: 0,
                    max: 1,
                    value: value,
                    label: "${value.toStringAsFixed(1)}",
                    onChanged: (value) {
                      _sliderValue.value = value;
                    },
                  ),
                );
              }),
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: const RoundSliderOverlayShape(),
                    thumbShape: const RoundSliderThumbShape(),
                    valueIndicatorShape: RectangularSliderValueIndicatorShape(),
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    min: 0,
                    max: 1,
                    value: value,
                    label: "${value.toStringAsFixed(1)}",
                    onChanged: (value) {
                      _sliderValue.value = value;
                    },
                  ),
                );
              }),
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return Slider(
                    min: 0,
                    max: 1,
                    divisions: 10,
                    value: value,
                    onChanged: (value) {
                      _sliderValue.value = value;
                    });
              }),
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: const RoundSliderOverlayShape(),
                    thumbShape: const RoundSliderThumbShape(),
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  ),
                  child: Slider(
                    min: 0,
                    max: 1,
                    divisions: 10,
                    value: value,
                    label: "$value",
                    onChanged: (value) {
                      _sliderValue.value = value;
                    },
                  ),
                );
              }),
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: const RoundSliderOverlayShape(),
                    thumbShape: const RoundSliderThumbShape(),
                    valueIndicatorShape: RectangularSliderValueIndicatorShape(),
                  ),
                  child: Slider(
                    min: 0,
                    max: 1,
                    divisions: 10,
                    value: value,
                    label: "$value",
                    onChanged: (value) {
                      _sliderValue.value = value;
                    },
                  ),
                );
              }),
          ValueListenableBuilder<double>(
              valueListenable: _sliderValue,
              builder: (context, value, widget) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: const RoundSliderOverlayShape(),
                    showValueIndicator: ShowValueIndicator.never,
                    thumbShape: CustomCircleThumbShape(
                      thumbRadius: 14,
                      strokeWidth: 4,
                      fillColor: const Color.fromRGBO(24, 27, 35, 1),
                      strokeColor: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    trackHeight: 8,
                    valueIndicatorTextStyle: TextStyle(
                      fontSize: 18,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    valueIndicatorColor: Colors.transparent,
                  ),
                  child: Slider(
                    min: 0,
                    max: 1,
                    value: value,
                    label: "${value.toStringAsFixed(1)}",
                    onChanged: (value) {
                      _sliderValue.value = value;
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

/// CustomCircleThumbShape
class CustomCircleThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double strokeWidth;
  final Color strokeColor;
  final Color fillColor;

  final _indicatorShape = const RectangularSliderValueIndicatorShape();

  const CustomCircleThumbShape({
    required this.thumbRadius,
    required this.strokeWidth,
    required this.strokeColor,
    required this.fillColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = fillColor
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = strokeColor
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);

    _indicatorShape.paint(
      context,
      center,
      activationAnimation: const AlwaysStoppedAnimation(1),
      enableAnimation: enableAnimation,
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      textDirection: textDirection,
    );
  }
}
