import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/search/content/slider_page.dart';

import 'content/image_page.dart';
import 'content/text_page.dart';

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
    SearchModel.newInstance(
      searchName: ["Slider"],
      searchDescription: "searchDescription",
      searchWidget: SliderPage(),
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
