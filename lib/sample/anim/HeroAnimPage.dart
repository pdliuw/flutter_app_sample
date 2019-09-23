import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/sample/CollapsingToolbarPage.dart';

///
/// HeroAnimPage
/// 过渡动画
///
class HeroAnimPage extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(titleName: "Hero animation");
  }

  @override
  Widget createWidget() {
    return Center(
      child: GestureDetector(
        onTap: () {
          /*
          为Hero动画加"透明动画的页面切换"
           */
          Navigator.push(getContext(), PageRouteBuilder(pageBuilder:
              (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: CollapsingToolbarPage(),
            );
          }));
//          pushNamed(
//              routeName: "CollapsingToolbarPage",
//              enterParameter:
//                  EnterParameter(previousPageContext: getContext()));
        },
        child: Card(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Hero(
                tag: "hero_image",
                child: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.contain,
                ),
              ),
              Hero(
                tag: "hero_text",
                child: Text(
                  "点击我,查看Hero效果",
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
