import 'package:flutter/material.dart';

class LineChartPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Text(
                'LineChart',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              // LineChartSample3(),
              // LineChartSample4(),
              // LineChartSample7(),
              // LineChartSample5(),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Range annotations and dashed path',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              // LineChartSample8(),
            ],
          ),
        ),
      ),
    );
  }
}
