// import 'package:ai_sun/ai_sun.dart';
import 'package:flutter/material.dart';

///
/// SunMainPage
class SunMainPage extends StatefulWidget {
  @override
  _SunMainPageState createState() => _SunMainPageState();
}

class _SunMainPageState extends State<SunMainPage> {
  var rangeValues = RangeValues(0.1, 0.5);

  double _max(double value) {
    return value * 100 * 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("custom painter page"),
    //   ),
    //   body: Column(
    //     children: [
    //       AppTextHeadline6Widget.defaultStyle(data: "拖动滑轮右侧按钮预览自绘制组件的尺寸变动"),
    //       Row(
    //         children: [
    //           Expanded(
    //             child: RangeSlider(
    //               values: rangeValues,
    //               divisions: 9,
    //               labels: RangeLabels("${_max(rangeValues.start)}", "${_max(rangeValues.end)}"),
    //               onChanged: (values) {
    //                 setState(() {
    //                   rangeValues = values;
    //                 });
    //               },
    //             ),
    //           )
    //         ],
    //       ),
    //       Container(
    //         width: _max(rangeValues.end),
    //         height: _max(rangeValues.end),
    //         child: CustomPaint(
    //           foregroundPainter: AiSmilePainter.defaultStyle(
    //             color: Colors.transparent,
    //           ),
    //           painter: AiSmilePainter.defaultStyle(
    //             color: Colors.yellow,
    //           ),
    //         ),
    //       ),
    //       Divider(
    //         height: 8,
    //       ),
    //       Container(
    //         width: _max(rangeValues.end),
    //         height: _max(rangeValues.end),
    //         child: CustomPaint(
    //           foregroundPainter: AiSunPainter.defaultStyle(
    //             color: Colors.transparent,
    //           ),
    //           painter: AiSunPainter.defaultStyle(
    //             color: Colors.yellow,
    //           ),
    //         ),
    //       ),
    //       Divider(
    //         height: 8,
    //       ),
    //       Container(
    //         width: _max(rangeValues.end),
    //         height: _max(rangeValues.end),
    //         child: CustomPaint(
    //           foregroundPainter: AiSimpleSunPainter.defaultStyle(
    //             color: Colors.transparent,
    //           ),
    //           painter: AiSimpleSunPainter.defaultStyle(
    //             color: Colors.yellow,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
