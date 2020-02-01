import 'package:flutter/material.dart';
import 'package:snappable/snappable.dart';

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
  final _snappableKey = GlobalKey<SnappableState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anappable anim"),
      ),
      body: Column(
        children: <Widget>[
          Snappable(
            key: _snappableKey,
            snapOnTap: true,
            child: Card(
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.deepPurple,
                alignment: Alignment.center,
                child: Text(
                  'This will be sanpped',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              "Snap / Reverse",
            ),
            onPressed: () {
              SnappableState state = _snappableKey.currentState;
              if (state.isGone) {
                state.reset();
              } else {
                state.snap();
              }
            },
          )
        ],
      ),
    );
  }
}
