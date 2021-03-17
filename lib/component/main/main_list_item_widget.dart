import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// MainListItemWidget
class MainListItemWidget extends StatefulWidget {
  dynamic itemData;
  MainListItemWidget.defaultStyle({
    Key key,
    @required this.itemData,
  }) : super(key: key) {}
  @override
  _MainListItemWidgetState createState() => _MainListItemWidgetState();
}

class _MainListItemWidgetState extends State<MainListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return AppCardOutlinedStyleWidget.defaultStyle(
      onTap: () {
        Airoute.pushNamedWithAnimation(
          routeName: "${widget.itemData['routeName']}",
          routePageAnimation: AirouteTransition.Slide,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text("${widget.itemData['title'].substring(0, 1)}"),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextSubtitle1Widget.defaultStyle(
                  "${widget.itemData['title']}"),
              Row(
                children: [
                  Expanded(
                      child: AppTextBodyText2Widget.defaultStyle(
                          "${widget.itemData['subtitle']}"))
                ],
              ),
              SvgPicture.network(
                "${widget.itemData['link']['version']}",
              ),
            ],
          )),
        ],
      ),
    );
  }
}
