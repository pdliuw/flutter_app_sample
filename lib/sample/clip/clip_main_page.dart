import 'dart:math';

import 'package:flutter/material.dart';

const STAR_POINTS = 5;
const POLY_POINTS = 15;

enum Clipper { random, wave, star, dash }

///
/// ClipMainPage
class ClipMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClipMainState();
  }
}

///
/// _ClipMainState
class _ClipMainState extends State<ClipMainPage> {
  Clipper _clipper = Clipper.random;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Clip"),
            Spacer(
              flex: 1,
            ),
            Transform.scale(
              scale: 0.2,
              child: ClipPath(
                clipper: _getClipper(),
                child: WhiteBox(200.0),
              ),
            ),
            Spacer(
              flex: 20,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              ClipPath(
                clipper: _getClipper(),
                child: BlueBox(200.0),
              ),
              Spacer(),
              Text("Custom Clipper:"),
              Spacer(),
              RadioListTile<Clipper>(
                title: const Text('Random'),
                value: Clipper.random,
                groupValue: _clipper,
                onChanged: (Clipper? value) {
                  setState(() {
                    _clipper = value!;
                  });
                },
              ),
              RadioListTile<Clipper>(
                title: const Text('Wave'),
                value: Clipper.wave,
                groupValue: _clipper,
                onChanged: (Clipper? value) {
                  setState(() {
                    _clipper = value!;
                  });
                },
              ),
              RadioListTile<Clipper>(
                title: const Text('Star'),
                value: Clipper.star,
                groupValue: _clipper,
                onChanged: (Clipper? value) {
                  setState(() {
                    _clipper = value!;
                  });
                },
              ),
              RadioListTile<Clipper>(
                title: const Text('Dash'),
                value: Clipper.dash,
                groupValue: _clipper,
                onChanged: (Clipper? value) {
                  setState(() {
                    _clipper = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomClipper<Path> _getClipper() {
    switch (_clipper) {
      case Clipper.wave:
        return WaveClipper();
        break;
      case Clipper.random:
        return RandomClipper();
        break;
      case Clipper.star:
        return StarClipper();
        break;
      case Clipper.dash:
        return DashClipper();
        break;
      default:
        return RandomClipper();
    }
  }
}

class BlueBox extends StatelessWidget {
  final size;

  BlueBox(this.size);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.blue),
      child: SizedBox(
        height: size,
        width: size,
      ),
    );
  }
}

class WhiteBox extends StatelessWidget {
  final size;

  WhiteBox(this.size);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: SizedBox(
        height: size,
        width: size,
      ),
    );
  }
}

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var path = Path();

    var radius = size.width / 2;
    var inner = radius / 2;
    var rotation = pi / 2 * 3;
    var step = pi / STAR_POINTS;

    path.lineTo(centerX, centerY - radius);

    for (var i = 0; i < STAR_POINTS; i++) {
      var x = centerX + cos(rotation) * radius;
      var y = centerY + sin(rotation) * radius;
      path.lineTo(x, y);
      rotation += step;

      x = centerX + cos(rotation) * inner;
      y = centerY + sin(rotation) * inner;
      path.lineTo(x, y);
      rotation += step;
    }

    path.lineTo(centerX, centerY - radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RandomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var rand = Random();

    path.addPolygon(
        List.generate(
          POLY_POINTS,
          (index) => Offset(rand.nextDouble() * size.width, rand.nextDouble() * size.height),
        ),
        true);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .8);
    path.quadraticBezierTo(size.width / 3, size.height, size.width, size.height * .6);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DashClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.6929134, 72.083992);
    path.relativeLineTo(9.7270346, -10.425198);
    path.relativeLineTo(31.091862, 31.963253);
    path.relativeLineTo(19.107612, -22.755906);
    path.relativeLineTo(10.073494, -36.824146);
    path.relativeLineTo(32.482934, -19.800526);
    path.relativeLineTo(-6.2572174, -7.8162728);
    path.relativeLineTo(25.711288, -0.17322826);
    path.relativeLineTo(-6.603676, 7.989501);
    path.relativeLineTo(17.88977, 3.301837);
    path.relativeLineTo(30.225724, 18.23622);
    path.relativeLineTo(9.02887, 18.587928);
    path.relativeLineTo(27.443558, 7.6430436);
    path.relativeLineTo(-27.27034, 6.425194);
    path.relativeLineTo(0.87139892, 19.454071);
    path.relativeLineTo(-11.464569, 22.57743);
    path.relativeLineTo(1.9107666, 13.7217864);
    path.relativeLineTo(14.939621, 2.6089172);
    path.relativeLineTo(-19.627288, 4.5144348);
    path.relativeLineTo(-4.519684, -19.800522);
    path.relativeLineTo(-9.9002686, 15.112862);
    path.relativeLineTo(-33.522308, 5.90551);
    path.relativeLineTo(-30.918632, -13.375328);
    path.relativeLineTo(-40.120736, -11.1181106);
    path.relativeLineTo(-10.9448814, -13.02887);
    path.lineTo(0.6929134, 72.083992);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
