import 'package:data/repository_failure.dart';

abstract class BookFailure {
  BookFailure([List properties = const <dynamic>[]]) : super();
}

class BookRepositoryFailure extends BookFailure {
  late final RepositoryFailure failure;

  BookRepositoryFailure({required this.failure}) : super([failure]);
}

// This class is used for specific errors from the service
class GetBookError extends BookFailure {}
