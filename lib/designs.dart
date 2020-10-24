import 'package:flutter/material.dart';

class designs extends StatefulWidget {
  @override
  _designsState createState() => _designsState();
}

class _designsState extends State<designs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            // ClipPath(
            //   clipper: MyClipper(),
            //   child: Container(
            //     width: double.infinity,
            //     height: 200,
            //     color: Colors.yellow[800],
            //   ),
            // ),
            // ClipPath(
            //   clipper: MyClipperGreen(),
            //   child: Container(
            //     width: double.infinity,
            //     height: 200,
            //     color: Colors.red,
            //   ),
            // ),

            SafeArea(
              child: CustomPaint(
                size: Size(1000.0, 500.0),
                painter: RPSCustomPainterFinal(),
              ),
            ),
            SafeArea(
              child: CustomPaint(
                size: Size(1000.0, 500.0),
                painter: RPSCustomPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyClipperGreen extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyClipperCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 2 - 200, size.height);
    var firstEndPoint = Offset(size.width / 2 - 50, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width - 100), 100);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, size.height * 0.30, 0, size.height * 0.40);
    path.cubicTo(size.width * 0.12, size.height * 0.40, size.width * 0.19,
        size.height * 0.26, size.width * 0.19, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.19, size.height * 0.00, size.width * 0.31, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterFinal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, size.height * 0.50, 0, size.height * 0.80);
    path.cubicTo(size.width * 0.27, size.height * 0.70, size.width * 0.27,
        size.height * 0.70, size.width * 0.28, size.height * 0.40);
    path.quadraticBezierTo(
        size.width * 0.37, size.height * 0.10, size.width * 0.63, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
