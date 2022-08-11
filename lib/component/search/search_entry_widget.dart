import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

/// SearchEntryWidget
class SearchEntryWidget extends StatefulWidget {
  const SearchEntryWidget({Key? key}) : super(key: key);

  @override
  State<SearchEntryWidget> createState() => _SearchEntryWidgetState();
}

class _SearchEntryWidgetState extends State<SearchEntryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.search_sharp),
        onPressed: () {
          Airoute.pushNamed(routeName: "/SearchPage");
        },
      ),
    );
  }
}
