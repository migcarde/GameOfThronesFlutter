import 'package:dartz/dartz.dart';
import 'package:domain/operations/chars/char_business.dart';
import 'package:domain/operations/chars/char_failure.dart';

abstract class CharRepository {
  Future<Either<CharFailure, List<CharBusiness>>> getChars(int type);
}
