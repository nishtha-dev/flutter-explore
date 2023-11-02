// import 'dart:ui';

// import 'package:flutter/material.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Oval Clip Example')),
//         body: Center(
//           child: OvalClipImage(
//             imagePath: 'assets/oval_shape.svg',
//             rectangularImagePath: 'assets/rectangular_image.jpg',
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OvalClipImage extends StatelessWidget {
//   final String imagePath;
//   final String rectangularImagePath;

//   OvalClipImage({required this.imagePath, required this.rectangularImagePath});

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: OvalClipper(),
//       child: Image.asset(
//         rectangularImagePath,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

// class OvalClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final svgPath = Image.asset('assets/oval_shape.svg');
//     return Path.from( // Convert SVG path to Flutter path
//       PathMetrics.fromPath(svgPath.pictureProvider.resolve(StreamProvider()).last).first.extractPath(0),
//     );
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
