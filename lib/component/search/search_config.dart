import 'package:flutter/material.dart';

import 'widget/image_page.dart';
import 'widget/text_page.dart';

/// SearchConfig
class SearchConfig {
  SearchConfig._();

  static List<SearchModel> searchList = [
    SearchModel.newInstance(
      searchName: ["Text"],
      searchDescription: "searchDescription",
      searchWidget: TextPage(),
    ),
    SearchModel.newInstance(
      searchName: ["Image"],
      searchDescription: "searchDescription",
      searchWidget: ImagePage(),
    ),
  ];
}

class SearchModel {
  final List<String> searchName;
  final String searchDescription;
  final Widget searchWidget;

  SearchModel.newInstance({
    required this.searchName,
    required this.searchDescription,
    required this.searchWidget,
  });
}
