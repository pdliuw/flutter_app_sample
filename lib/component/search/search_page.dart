import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'search_config.dart';

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
  final ValueNotifier<List<SearchModel>> _valueNotifier = ValueNotifier([]);

  @override
  void initState() {
    _valueNotifier.value = SearchConfig.searchList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CupertinoSearchTextField(
              onChanged: (search) {
                if (search.isNotEmpty) {
                  _valueNotifier.value = SearchConfig.searchList.where((element) {
                    return element.searchName.contains(search);
                  }).toList();
                } else {
                  _valueNotifier.value = SearchConfig.searchList;
                }
              },
            ),
            Expanded(
              child: ValueListenableBuilder<List<SearchModel>>(
                valueListenable: _valueNotifier,
                builder: (context, searchList, widget) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      var searchItem = searchList[index];
                      return ListTile(
                        title: Text("${searchItem.searchName}"),
                        onTap: () {
                          Airoute.push(route: MaterialPageRoute(builder: (context) {
                            return searchItem.searchWidget;
                          }));
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: searchList.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }
}
