import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class MainSortListPage extends AppCommonStatefulPage {
  String titleName = "主页";
  @override
  Config createConfig() {
    return Config(
      titleName: titleName,
      showBackArrow: true,
    );
  }

  @override
  Widget createWidget() {
    return ListView(
      children: <Widget>[
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            pushNamed(
              routeName: "ViewPagerFragmentPage",
              enterParameter: EnterParameter(previousPageContext: getContext()),
            );
          },
          child: Text("Toolbar+ViewPager+Fragment"),
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            pushNamed(
              routeName: "CollapsingToolbarPage",
              enterParameter: EnterParameter(previousPageContext: getContext()),
            );
          },
          child: Text("Collapsing+Toolbar+Fragment"),
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            pushNamed(
              routeName: "ViewPagerFragmentPage",
              enterParameter: EnterParameter(previousPageContext: getContext()),
            );
          },
          child: Text("Animation"),
        ),
      ],
    );
  }
}
