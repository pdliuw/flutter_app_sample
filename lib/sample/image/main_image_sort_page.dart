import 'package:flutter/material.dart';

///
/// MainImageSortPage
class MainImageSortPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainImageSortState();
  }
}

///
/// _MainImageSortState
class _MainImageSortState extends State<MainImageSortPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
