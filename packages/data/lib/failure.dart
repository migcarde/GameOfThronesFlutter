const REPOSITORY_EXCEPTION = 0;
const NO_INTERNET = 1;
const UNAUTHORIZED = 2;
const SERVER_ERROR = 3;
const UNKNOWN = 4;

abstract class Failure {
  Failure([List properties = const <dynamic>[]]) : super();
}

class RepositoryException extends Failure {}

class NoInternet extends Failure {}

class Unauthorized extends Failure {
  late final String message;

  Unauthorized({required this.message}) : super([message]);
}

class ServerError extends Failure {}

class Unknown extends Failure {
  late final String message;

  Unknown({required this.message}) : super([message]);
}
