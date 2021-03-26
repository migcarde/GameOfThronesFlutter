import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

void printResponse(Response response) {
  debugPrint('Request: ${response.request.toString()}');
  debugPrint('Headers: ${response.headers}');
  debugPrint('Response-body: ${response.statusCode}');
  debugPrint(response.body);
}
