import 'package:flutter/material.dart';

///
/// FittedBox
class FittedBoxPage extends StatefulWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> with SingleTickerProviderStateMixin {
  final List<String> _list = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: (_list.length + 1).toDouble(),
      duration: Duration(seconds: 1 * _list.length),
      reverseDuration: Duration(seconds: 1 * _list.length),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _animationController.forward();
      }
    });

    //post
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
      ),
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            int length = (_animationController.value).toInt();
            String value = _getValueFromList(length);

            return Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: FittedBox(
                      child: Text("$value"),
                    ),
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: Center(
                    child: TextField(
                      enabled: false,
                      controller: TextEditingController(text: value),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            );
          }),
    );
  }

  String _getValueFromList(int length) {
    int subEnd = length++;
    List subList = _list.sublist(0, subEnd);
    return subList.toString();
  }
}
