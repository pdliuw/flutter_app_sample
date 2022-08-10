import 'package:flutter/material.dart';

///
/// NavigationRailPage
class NavigationRailPage extends StatefulWidget {
  const NavigationRailPage({Key? key}) : super(key: key);

  @override
  _NavigationRailPageState createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {
  final List<dynamic> _list = [
    {
      "icon": Icon(Icons.favorite_border),
      "selectedIcon": Icon(Icons.favorite),
      "label": Text('First'),
    },
    {
      "icon": Icon(Icons.bookmark_border),
      "selectedIcon": Icon(Icons.book),
      "label": Text('Second'),
    },
    {
      "icon": Icon(Icons.star_border),
      "selectedIcon": Icon(Icons.star),
      "label": Text('Third'),
    },
  ];
  int _selectedIndex = 0;
  bool _extended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigationRail"),
      ),
      body: Row(
        children: [
          NavigationRail(
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    tooltip: "菜单",
                    onPressed: () {
                      setState(() {
                        _extended = !_extended;
                      });
                    },
                    icon: Icon(Icons.menu)),
              ],
            ),
            destinations: [for (int railIndex = 0, railSize = _list.length; railIndex < railSize; railIndex++) NavigationRailDestination(icon: _list[railIndex]['icon'], selectedIcon: _list[railIndex]['selectedIcon'], label: _list[railIndex]['label'])],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int selectedIndex) {
              setState(() {
                _selectedIndex = selectedIndex;
              });
            },
            labelType: _extended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
            extended: _extended,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: _list[_selectedIndex]['selectedIcon'],
                ),
                Text("selectedIndex:$_selectedIndex"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
