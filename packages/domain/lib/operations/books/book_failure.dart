import 'package:data/repository_failure.dart';

abstract class BookFailure {
  BookFailure([List properties = const <dynamic>[]]) : super();
}

class BookRepositoryFailure extends BookFailure {
  late final RepositoryFailure failure;

  BookRepositoryFailure({required this.failure}) : super([failure]);
}

class GetBookError extends BookFailure {}
