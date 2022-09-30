import 'dart:io';

import 'package:http/io_client.dart' as http_io;

class ApiClient extends http_io.IOClient {
  ApiClient() : super(_innerClient());

  // For Demo purpose,
  //
  // You can add headers by overriding send method here.

}

_innerClient() => HttpClient()..connectionTimeout = const Duration(seconds: 8);
