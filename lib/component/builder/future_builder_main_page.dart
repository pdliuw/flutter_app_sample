import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// FutureBuilderMainPage
class FutureBuilderMainPage extends StatefulWidget {
  const FutureBuilderMainPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderMainPageState createState() => _FutureBuilderMainPageState();
}

class _FutureBuilderMainPageState extends State<FutureBuilderMainPage> {
  final List _list = [
    {
      "title": "使用FutureBuilder异步操作",
      "routeName": "/FutureBuilderMainPage/FutureBuilderAsyncRequestPage",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
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
