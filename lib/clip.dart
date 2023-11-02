import 'package:flutter/material.dart';

class OvalClipImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Oval Clipped Image')),
      body: Center(
        child: ClipPath(
          clipper: OvalClipPath(), // Use the custom clipper here
          child: Image.network(
            'assets/certificates/certificates/old_people_working_out.png', // Replace with your image URL
            fit: BoxFit.cover,
            width: 300,
            height: 200,
          ),
        ),
      ),
    );
  }
}

// class OvalClipPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     // path.moveTo(0, size.height); // Move to the bottom-left corner
//     path.moveTo(size.width, 0);

//     // Define the control points to create an oval shape
//     final controlPoint1 = Offset(size.width * 1.5, size.height * 0.5);
//     final controlPoint2 = Offset(size.width, size.height);

//     // Create the oval shape using a quadratic bezier curve
//     path.quadraticBezierTo(
//         controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy);

//     // Close the path to form a full shape
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

class OvalClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Move to the bottom-left corner

    // Define the control points to create an oval shape
    final controlPoint1 = Offset(size.width * 0.5, size.height * 0.2);
    final controlPoint2 = Offset(size.width, size.height);

    // Create the oval shape using a quadratic bezier curve
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy);

    // Close the path to form a full shape
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

