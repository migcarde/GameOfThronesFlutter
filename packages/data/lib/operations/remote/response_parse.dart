import 'dart:convert';

import 'package:data/repository_failure.dart';
import 'package:http/http.dart';

const BAD_REQUEST = 400;
const UNAUTHORIZED = 401;
const INTERNAL_SERVER_ERROR = 500;

List<dynamic> parsedResponse(Response response) {
  if (response.statusCode == BAD_REQUEST) {
    throw RepositoryException();
  } else if (response.statusCode == UNAUTHORIZED) {
    throw Unauthorized();
  } else if (response.statusCode >= INTERNAL_SERVER_ERROR) {
    throw Unknown();
  } else {
    return jsonDecode(response.body);
  }
}
