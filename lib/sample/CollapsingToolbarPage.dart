import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class CollapsingToolbarPage extends AppCommonStatefulPage {
  var titleName = "CollapsingToolbar";
  bool _sliverAppBarPinned = true;
  bool _sliverAppBarPinnedChecked = true;
  @override
  Config createConfig() {
    return Config(
      titleName: titleName,
      showAppBar: false,
      customBuildWidget: false,
    );
  }

  @override
  Widget createWidget() {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    /*
                    关闭页面
                     */
                    pop();
                  },
                  child: Tooltip(
                    message: "退出",
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                actions: <Widget>[
                  SelectableText(
                    '长按某视图，可查看功能提示',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    showCursor: true,
                    autofocus: true,
                  ),
                  Tooltip(
                    message: "切换：固定Toolbar",
                    child: Checkbox(
                      value: _sliverAppBarPinnedChecked,
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      onChanged: (bool checked) {
                        /*
                      checked:
                      false|true|null
                       */
                        if (checked != null) {
                          if (checked) {
                            showToast("固定Toolbar，缩小时会显示最小值");
                          } else {
                            showToast("不固定Toolbar，缩小时完全隐藏");
                          }
                        }

                        setState(stateCallback: () {
                          _sliverAppBarPinnedChecked = checked;
                          if (checked != null) {
                            _sliverAppBarPinned = checked;
                          }
                        });
                      },
                      tristate: true,
                    ),
                  )
                ],
                floating: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Hero(
                    tag: "hero_text不使用",
                    child: Text(titleName),
                  ),
                  background: Hero(
                      tag: "hero_image",
                      child: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                      )),
                  centerTitle: true,
                  titlePadding: EdgeInsets.all(10),
                  collapseMode: CollapseMode.parallax,
                ),
                pinned:
                    _sliverAppBarPinned, //固定(如果为true,则缩小时会显示最小值；如果为false，则缩小时完全隐藏)
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: false,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Tab 1"),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                    ],
                  ),
                ),
                pinned: true, //固定
              ),
            ];
          },
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      child: Text("Air"),
                    ),
                    title: Text("title"),
                    subtitle: Text("subTitle"),
                    selected: true,
                    trailing: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350"),
                  ),
                );
              }),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
