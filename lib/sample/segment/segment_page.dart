import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// SegmentPage
class SegmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SegmentState();
  }
}

///
/// _SegmentState
class _SegmentState extends State<SegmentPage> {
  final Map<int, Widget> _segmentChildren = const {
    0: Text('Child 1'),
    1: Text('Child 2'),
    2: Text('Child 3'),
    3: Text('Child 4'),
    4: Text('Child 5'),
    5: Text('Child 6'),
  };
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segment"),
      ),
      body: Column(
        children: <Widget>[
          CupertinoSegmentedControl<int>(
            children: _segmentChildren,
            onValueChanged: (int newValue) {
              setState(() {
                _currentValue = newValue;
              });
            },
            padding: EdgeInsets.all(15),
            groupValue: _currentValue,
          ),
          CupertinoSlidingSegmentedControl<int>(
            children: _segmentChildren,
            onValueChanged: (int newValue) {
              setState(() {
                _currentValue = newValue;
              });
            },
            padding: EdgeInsets.all(15),
            groupValue: _currentValue,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
