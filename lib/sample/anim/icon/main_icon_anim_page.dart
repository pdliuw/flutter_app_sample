import 'package:flutter/material.dart';

/// MainIconAnimPage
/// Icons with animation
class MainIconAnimPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainIconAnimState();
  }
}

class _MainIconAnimState extends State<MainIconAnimPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.duration = Duration(seconds: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.stop();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IconAnim"),
      ),
      body: Row(
        children: <Widget>[
          Spacer(),
          Column(
            children: <Widget>[
              Spacer(),
              AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.pause_play, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.add_event, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.close_menu, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.ellipsis_search, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.event_add, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.home_menu, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.list_view, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.menu_home, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: _animationController),
              AnimatedIcon(icon: AnimatedIcons.view_list, progress: _animationController),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.isAnimating || _animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _animationController),
      ),
    );
  }
}
