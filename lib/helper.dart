import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkHelper {
  // final String _serverUrl = dotenv.env['SERVER_URL']!;
  final String _certificatePath =
      'assets/certificates/certificates/sni.cloudflaressl.com.pem';

  Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://uat.example.com',
    validateStatus: (status) => status! < 500,
  ));

  Future<Response> getData() async {
    try {
      final certificateData = await rootBundle
          .load('assets/certificates/certificates/sni.cloudflaressl.com.pem')
          .then((bytes) => bytes.buffer.asUint8List());

      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) =>
                _validateCertificate(cert, certificateData);
        return client;
      };

      final response = await _dio.get('https://jsonplaceholder.typicode.com');
      print("Response---> $response");
      return response;
    } catch (e) {
      print("Error-> $e");
      throw e;
    }
  }

  bool _validateCertificate(X509Certificate cert, List<int> data) {
    final bytes = cert.pem;
    final len = bytes.length;
    for (int i = 0; i < len; i += 64) {
      final end = (i + 64 < len) ? i + 64 : len;
      if (bytes.substring(i, end) != String.fromCharCodes(data, i, end)) {
        return false;
      }
    }
    return true;
  }
}
