import 'package:dartz/dartz.dart';
import 'package:data/failure.dart';

abstract class BaseUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
