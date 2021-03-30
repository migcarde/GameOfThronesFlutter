import 'package:data/repository_failure.dart';

abstract class HouseFailure {
  HouseFailure([List properties = const <dynamic>[]]) : super();
}

class HouseRepositoryFailure extends HouseFailure {
  late final RepositoryFailure failure;

  HouseRepositoryFailure({required this.failure}) : super([failure]);
}

// This class is used for specific errors from the service
class GetHouseError extends HouseFailure {}
