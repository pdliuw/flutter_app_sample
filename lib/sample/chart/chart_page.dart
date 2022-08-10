import 'package:flutter/material.dart';

import 'bar_chart/bar_chart_page.dart';
import 'bar_chart/bar_chart_page2.dart';
import 'line_chart/line_chart_page.dart';
import 'line_chart/line_chart_page2.dart';
import 'line_chart/line_chart_page3.dart';
import 'line_chart/line_chart_page4.dart';
import 'pie_chart/pie_chart_page.dart';
import 'scatter_chart/scatter_chart_page.dart';

///
/// ChartPage
class ChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartState();
  }
}

///
/// _ChartState
class _ChartState extends State<ChartPage> {
  late PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    DefaultTabController _defaultTabController = DefaultTabController(
      length: 8,
      initialIndex: _currentIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chart"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                isScrollable: true,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                    _pageController.jumpToPage(_currentIndex);
                  });
                },
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(
                    text: "LineChart",
                    icon: Icon(Icons.drafts),
                  ),
                  Tab(
                    text: "BarChart",
                    icon: Icon(Icons.more),
                  ),
                  Tab(
                    text: "BarChart",
                    icon: Icon(Icons.drafts),
                  ),
                  Tab(
                    text: "PieChart",
                    icon: Icon(Icons.more),
                  ),
                  Tab(
                    text: "LineChart",
                    icon: Icon(Icons.drafts),
                  ),
                  Tab(
                    text: "LineChart",
                    icon: Icon(Icons.more),
                  ),
                  Tab(
                    text: "LineChart",
                    icon: Icon(Icons.drafts),
                  ),
                  Tab(
                    text: "ScatterChart",
                    icon: Icon(Icons.more),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  LineChartPage(),
                  BarChartPage(),
                  BarChartPage2(),
                  PieChartPage(),
                  LineChartPage2(),
                  LineChartPage3(),
                  LineChartPage4(),
                  ScatterChartPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return _defaultTabController;
  }
}
