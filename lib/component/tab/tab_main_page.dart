import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// TabMainPage
class TabMainPage extends StatefulWidget {
  const TabMainPage({Key? key}) : super(key: key);

  @override
  _TabMainPageState createState() => _TabMainPageState();
}

class _TabMainPageState extends State<TabMainPage> {
  final List<dynamic> list = [
    {
      "name": "NavigationRail widget",
      "routeName": "/TabMainPage/NavigationRailPage",
    },
    {
      "name": "Navigation Drawer widget",
      "routeName": "/TabMainPage/NavigationDrawerPage",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab & Navigation"),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return AppCardOutlinedStyleWidget.defaultStyle(
              onTap: () {
                Airoute.pushNamed(routeName: "${list[index]['routeName']}");
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: AppTextHeadline6Widget.defaultStyle(data: "${list[index]['name']}"),
              ),
            );
          }),
    );
  }
}
