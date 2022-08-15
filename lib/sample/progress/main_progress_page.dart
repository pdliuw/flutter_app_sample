import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/material.dart' hide CircularProgressIndicator;

///
/// MainProgressPage
class MainProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<MainProgressPage> {
  @override
  Widget build(BuildContext context) {
    return ExampleHomePage._(
      title: "Progress",
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  ExampleHomePage._({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExampleHomePage> {
  ValueNotifier<double> _sliderMax1Notifier = ValueNotifier(0.1);
  ValueNotifier<double> _sliderMax100Notifier = ValueNotifier(0.1);
  ValueNotifier<int> _sliderStepNotifier = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<double>(
                valueListenable: _sliderMax1Notifier,
                builder: (context, value, child) {
                  double max = 1.0;
                  double min = 0.0;
                  var sliderValue = value;
                  var progressValue = sliderValue;

                  return Column(
                    children: [
                      Slider(
                        min: min,
                        max: max,
                        value: sliderValue,
                        onChanged: (double newValue) {
                          _sliderMax1Notifier.value = newValue;
                        },
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            padding: EdgeInsets.all(5),
                            child: AirDashboardStateProgressIndicator(
                              size: Size(150, 150),
                              min: min,
                              max: max,
                              value: sliderValue,
                              valueColor: ColorTween(begin: Colors.grey, end: Colors.yellow).transform(progressValue)!,
                              pathStrokeWidth: 10,
                              valueStrokeWidth: 10,
                              gapDegree: 60,
                              roundCap: true,
                            ),
                          ),
                          Text("${(sliderValue * 100).toStringAsFixed(1)}%"),
                        ],
                      ),
                    ],
                  );
                }),
            Divider(),
            ValueListenableBuilder<double>(
                valueListenable: _sliderMax100Notifier,
                builder: (context, value, child) {
                  var min = 0.0;
                  var max = 100.0;
                  var sliderValue = value;

                  var colorProgress = sliderValue / 100;

                  return Column(
                    children: [
                      Slider(
                        min: min,
                        max: max,
                        value: sliderValue,
                        onChanged: (double newValue) {
                          _sliderMax100Notifier.value = newValue;
                        },
                      ),
                      //圆环、扇形样式的进度
                      Row(
                        children: [
                          Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                padding: EdgeInsets.all(5),
                                child: AirCircularStateProgressIndicator(
                                  size: Size(150, 150),
                                  min: min,
                                  max: max,
                                  value: sliderValue,
                                  pathColor: Colors.white,
                                  valueColor: ColorTween(begin: Colors.grey, end: Colors.red).transform(colorProgress)!,
                                  pathStrokeWidth: 10.0,
                                  valueStrokeWidth: 10.0,
                                  useCenter: false,
                                  filled: false,
                                  roundCap: true,
                                ),
                              ),
                              Text("${sliderValue.toStringAsFixed(1)}%"),
                            ],
                          ),
                          Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                padding: EdgeInsets.all(5),
                                child: AirCircularStateProgressIndicator(
                                  size: Size(150, 150),
                                  min: min,
                                  max: max,
                                  value: sliderValue,
                                  pathColor: Colors.white,
                                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).transform(colorProgress)!,
                                  pathStrokeWidth: 10.0,
                                  valueStrokeWidth: 10.0,
                                  useCenter: true,
                                  filled: true,
                                  roundCap: true,
                                ),
                              ),
                              Text("${sliderValue.toStringAsFixed(1)}%"),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                      //线性、步进样式的进度
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 50,
                            padding: EdgeInsets.all(5),
                            child: AirLinearStateProgressIndicator(
                              size: Size(150, 150),
                              min: min,
                              max: max,
                              value: sliderValue,
                              valueColor: ColorTween(begin: Colors.grey, end: Colors.purple).transform(colorProgress)!,
                              pathStrokeWidth: 10.0,
                              valueStrokeWidth: 10.0,
                              roundCap: true,
                            ),
                          ),
                          Text("${sliderValue.toStringAsFixed(1)}%"),
                        ],
                      ),
                      Divider(),
                      ValueListenableBuilder<int>(
                          valueListenable: _sliderStepNotifier,
                          builder: (context, value, child) {
                            var min = 0;
                            var max = 5;
                            var sliderValue = value;

                            return Column(
                              children: [
                                Slider(
                                  min: min.toDouble(),
                                  max: max.toDouble(),
                                  value: sliderValue.toDouble(),
                                  onChanged: (value) {
                                    _sliderStepNotifier.value = value.toInt();
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 50,
                                      padding: EdgeInsets.all(0),
                                      child: AirStepStateProgressIndicator(
                                        size: Size(150, 150),
                                        stepCount: max,
                                        stepValue: sliderValue,
                                        valueColor: ColorTween(begin: Colors.grey, end: Colors.red).transform(sliderValue / max)!,
                                        pathStrokeWidth: 10.0,
                                        valueStrokeWidth: 10.0,
                                      ),
                                    ),
                                    Text("${sliderValue / max * 100}%"),
                                  ],
                                )
                              ],
                            );
                          }),
                    ],
                  );
                }),
            Divider(),
            // Row(
            //   children: [
            //     Spacer(),
            //     Row(
            //       children: [
            //         Container(
            //           width: 250,
            //           height: 50,
            //           padding: EdgeInsets.all(0),
            //           child: AirStepStateProgressIndicator(
            //             size: Size(150, 150),
            //             stepCount: _segmentChildren.length,
            //             stepValue: _segmentValue,
            //             // valueColor:
            //             //     ColorTween(begin: Colors.grey, end: Colors.blue)
            //             //         .transform(_segmentValue / 10),
            //             pathStrokeWidth: 30.0,
            //             valueStrokeWidth: 30.0,
            //           ),
            //         ),
            //         Text("${_segmentValue / 10 * 100}%"),
            //       ],
            //     ),
            //     Spacer(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
