import 'package:data/repository_failure.dart';

abstract class CharFailure {
  CharFailure([List properties = const <dynamic>[]]) : super();
}

class CharRepositoryFailure extends CharFailure {
  late final RepositoryFailure failure;

  CharRepositoryFailure({required this.failure}) : super([failure]);
}

class GetCharError extends CharFailure {}
