import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// SearchPage
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

///
/// _SearchState
class _SearchState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(background: Paint()..color = Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
