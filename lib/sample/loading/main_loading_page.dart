import 'package:flutter/material.dart';
// import 'package:loading/indicator/ball_pulse_indicator.dart';
// import 'package:loading/loading.dart';

/// MainLoadingPage
class MainLoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainLoadingState();
  }
}

/// _MainLoadingState
class _MainLoadingState extends State<MainLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Container(
    //           child: Center(
    //             child: Loading(
    //                 indicator: BallPulseIndicator(),
    //                 size: 100.0,
    //                 color: Colors.pink),
    //           ),
    //         ),
    //         Container(
    //           child: Center(
    //             child: Loading(
    //                 indicator: BallPulseIndicator(),
    //                 size: 100.0,
    //                 color: Colors.pink),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
