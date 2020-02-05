import 'package:flutter/material.dart';
import 'package:airoute/airoute.dart';
import '../common/util/ToastUtil.dart';

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
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("$titleName"),
              leading: GestureDetector(
                onTap: () {
                  /*
                    关闭页面
                     */
                  Airoute.pop();
                },
                child: Tooltip(
                  message: "返回",
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              actions: <Widget>[
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
                          ToastUtil.showToast(message: "固定Toolbar，缩小时会显示最小值");
                        } else {
                          ToastUtil.showToast(message: "不固定Toolbar，缩小时完全隐藏");
                        }
                      }

                      setState(() {
                        _sliverAppBarPinnedChecked = checked;
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
                  child: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  ),
                ),
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
                    Tab(icon: Icon(Icons.more), text: "Tab 3"),
                    Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 4"),
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
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
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
