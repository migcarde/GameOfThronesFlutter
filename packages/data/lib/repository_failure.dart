const REPOSITORY_EXCEPTION = 0;
const NO_INTERNET = 1;
const UNAUTHORIZED = 2;
const SERVER_ERROR = 3;
const UNKNOWN = 4;

abstract class RepositoryFailure {
  RepositoryFailure([List properties = const <dynamic>[]]) : super();
}

class RepositoryException extends RepositoryFailure {}

class NoInternet extends RepositoryFailure {}

class Unauthorized extends RepositoryFailure {}

class ServerError extends RepositoryFailure {}

class Unknown extends RepositoryFailure {}
