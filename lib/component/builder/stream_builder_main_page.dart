import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// StreamBuilderMainPage
class StreamBuilderMainPage extends StatefulWidget {
  const StreamBuilderMainPage({Key? key}) : super(key: key);

  @override
  _StreamBuilderMainPageState createState() => _StreamBuilderMainPageState();
}

class _StreamBuilderMainPageState extends State<StreamBuilderMainPage> {
  final List _list = [
    {
      "title": "使用StreamBuilder异步操作",
      "routeName": "/StreamBuilderMainPage/StreamBuilderAsyncRequestPage",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return AppCardOutlinedStyleWidget.defaultStyle(
            onTap: () {
              Airoute.pushNamed(routeName: "${_list[index]['routeName']}");
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [Text("${_list[index]['title']}")],
              ),
            ),
          );
        },
        itemCount: _list.length,
      ),
    );
  }
}
