import 'package:flutter/material.dart';

///AppCommonListItem
///封装的通用的全局列表的项
///支持：
///1、侧滑动
///2、滑动删除项
///3、撤销操作2
///4、项点击事件
///TODO 进一步完善
class AppCommonListItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppCommonListItem();
  }
}

class _AppCommonListItem extends State<AppCommonListItem> {
  @override
  Widget build(BuildContext context) {
    return Text("此功能，待封装！！");
  }
}
