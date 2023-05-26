// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter/material.dart';


// final dio = Dio();
// final storage = FlutterSecureStorage();

// Future<void> fetch()async {
// final cert = await rootBundle.load('assets/cert.pem');
// final isTrusted = await CertUtils.verifyCertificate(cert: cert.buffer.asUint8List());
// SecurityContext sc = SecurityContext();
// sc.setTrustedCertificatesBytes(cert.buffer.asUint8List());
// if (isTrusted) {
//   final certificate = X509Certificate.fromData(cert.buffer.asUint8List());
//   final pem = certificate.toPem();
//   final publicKey = certificate.publicKey;
//   dio.options.extra['verifyPublicKeys'] = [publicKey];
//   dio.options.extra['certificate'] = pem;
// }

// }

// // Add interceptor to add headers and handle errors
// dio.interceptors.add(
//   InterceptorsWrapper(
//     onRequest: (options, handler) async {
//       // Add authorization header
//       final token = await storage.read(key: 'token');
//       options.headers['Authorization'] = 'Bearer $token';

//       return handler.next(options);
//     },
//     onError: (DioError e, handler) async {
//       // Handle errors
//       if (e.response?.statusCode == 401) {
//         // Logout the user if the token is expired or invalid
//         await storage.delete(key: 'token');
//         // Navigate to login screen
//         // ...
//       }

//       return handler.next(e);
//     },
//   ),
// );
