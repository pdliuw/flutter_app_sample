import 'package:flutter/material.dart';

///  TextPage
class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Column(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.topLeft,
                // radius: 1.0,
                colors: <Color>[Colors.yellow, Colors.red],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: const Text(
              'I’m burning the memories',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                // center: Alignment.topLeft,
                // // radius: 1.0,
                colors: <Color>[Colors.yellow, Colors.red],
                // tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: const Text(
              'I’m burning the memories',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
