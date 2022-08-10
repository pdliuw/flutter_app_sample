import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// MainListItemWidget
class MainListItemWidget extends StatefulWidget {
  dynamic itemData;
  MainListItemWidget.defaultStyle({
    Key? key,
    required this.itemData,
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
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          child: Text("${widget.itemData['title'].substring(0, 1)}"),
        ),
        title: Text("${widget.itemData['title']}"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.itemData['subtitle']}"),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
//                      InkWell(
//                          child: SvgPicture.network(
//                            "${widget.itemData['link']['version']}",
//                          ),
//                          onTap: () {
//                            launch("${widget.itemData['link']['pub']}");
//                          }),
                      InkWell(
                          child: Icon(
                            MaterialCommunityIcons.github,
                          ),
                          onTap: () {
                            launch("${widget.itemData['link']['github']}");
                          })
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    children: [
                      Icon(
                        MaterialCommunityIcons.copyright,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      AppTextBodyText2Widget.defaultStyle(data: "${widget.itemData['author']['nickname']}"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
