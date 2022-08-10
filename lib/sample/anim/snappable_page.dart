import 'package:flutter/material.dart';
// import 'package:snappable/snappable.dart';

///
/// AnappablePage
class AnappablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnappableState();
  }
}

///
/// _AnappableState
class _AnappableState extends State<AnappablePage> {
  // final _snappableKey = GlobalKey<SnappableState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Anappable anim"),
    //   ),
    //   body: Column(
    //     children: <Widget>[
    //       Snappable(
    //         key: _snappableKey,
    //         snapOnTap: true,
    //         child: Card(
    //           child: Container(
    //             height: 300,
    //             width: double.infinity,
    //             alignment: Alignment.center,
    //             child: Image.asset(
    //               "assets/pexels-photo-396547.jpg",
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       SnappableState state = _snappableKey.currentState;
    //       if (state.isGone) {
    //         state.reset();
    //       } else {
    //         state.snap();
    //       }
    //     },
    //     child: Icon(Icons.play_arrow),
    //   ),
    // );
  }
}
