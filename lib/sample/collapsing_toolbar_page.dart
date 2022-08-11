import 'package:flutter/material.dart';

import '../common/helper/tip_helper.dart';
import '../common/helper/tip_type.dart';

///
/// CollapsingToolbarPage
class CollapsingToolbarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollapsingToolbarState();
  }
}

///
/// _CollapsingToolbarState
class _CollapsingToolbarState extends State<CollapsingToolbarPage> {
  var titleName = "CollapsingToolbar";
  bool _sliverAppBarPinned = true;
  bool _sliverAppBarPinnedChecked = true;

  Widget createWidget() {
    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("$titleName"),
              leading: BackButton(),
              actions: <Widget>[
                Tooltip(
                  message: "切换：固定Toolbar",
                  child: Checkbox(
                    value: _sliverAppBarPinnedChecked,
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                    onChanged: (bool? checked) {
                      /*
                      checked:
                      false|true|null
                       */
                      if (checked != null) {
                        if (checked) {
                          TipHelper.showTip(
                            context: context,
                            tipType: TipType.INFO,
                            message: "固定Toolbar，缩小时会显示最小值",
                          );
                        } else {
                          TipHelper.showTip(
                            context: context,
                            tipType: TipType.INFO,
                            message: "不固定Toolbar，缩小时完全隐藏",
                          );
                        }
                      }

                      setState(() {
                        _sliverAppBarPinnedChecked = checked ?? false;
                        if (checked != null) {
                          _sliverAppBarPinned = checked;
                        }
                      });
                    },
                    tristate: true,
                  ),
                ),
                Icon(Icons.more_vert),
              ],
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Hero(
                  tag: "hero_text不使用",
                  child: Text(''),
                ),
                background: Hero(
                  tag: "hero_image",
                  child: Image.asset(
                    "assets/pexels-photo-396547.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.all(10),
                collapseMode: CollapseMode.parallax,
              ),
              pinned: _sliverAppBarPinned,
              //固定(如果为true,则缩小时会显示最小值；如果为false，则缩小时完全隐藏)
              bottom: TabBar(
                isScrollable: false,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: [
                  Tab(icon: Icon(Icons.info), text: "Tab 1"),
                  Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                  Tab(icon: Icon(Icons.more), text: "Tab 3"),
                  Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 4"),
                ],
              ),
              onStretchTrigger: () async {
                print("onStretchTrigger");
              },
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 20,
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
                trailing: Image.asset(
                  "assets/pexels-photo-396547.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createWidget(),
    );
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
