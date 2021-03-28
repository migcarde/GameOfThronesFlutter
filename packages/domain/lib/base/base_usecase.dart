import 'package:dartz/dartz.dart';

abstract class BaseUseCase<F, S, Params> {
  Future<Either<F, S>> call(Params params);
}

class NoParams {}
