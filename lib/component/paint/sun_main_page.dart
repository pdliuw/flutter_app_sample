import 'package:ai_sun/ai_sun.dart';
import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';

///
/// SunMainPage
class SunMainPage extends StatefulWidget {
  @override
  _SunMainPageState createState() => _SunMainPageState();
}

class _SunMainPageState extends State<SunMainPage> {
  var _min = 0.0;
  var _max = 200.0;
  var _value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("custom painter page"),
      ),
      body: Column(
        children: [
          AppTextHeadline6Widget.defaultStyle(data: "拖动滑轮右侧按钮预览自绘制组件的尺寸变动"),
          Row(
            children: [
              Expanded(
                child: Slider(
                  min: _min,
                  max: _max,
                  value: _value,
                  label: "${_value.toStringAsFixed(1)}",
                  onChanged: (values) {
                    setState(() {
                      _value = values;
                    });
                  },
                ),
              )
            ],
          ),
          Container(
            width: _value,
            height: _value,
            child: CustomPaint(
              foregroundPainter: AiSmilePainter(
                color: Colors.transparent,
              ),
              painter: AiSmilePainter(
                color: Colors.yellow,
              ),
            ),
          ),
          Divider(
            height: 8,
          ),
          Container(
            width: _value,
            height: _value,
            child: CustomPaint(
              foregroundPainter: AiSunPainter(
                color: Colors.transparent,
              ),
              painter: AiSunPainter(
                color: Colors.yellow,
              ),
            ),
          ),
          Divider(
            height: 8,
          ),
          Container(
            width: _value,
            height: _value,
            child: CustomPaint(
              foregroundPainter: AiSimpleSunPainter(
                color: Colors.transparent,
              ),
              painter: AiSimpleSunPainter(
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
