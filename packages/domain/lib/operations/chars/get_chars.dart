import 'package:dartz/dartz.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/operations/chars/char_business.dart';
import 'package:domain/operations/chars/char_failure.dart';
import 'package:domain/operations/chars/char_repository.dart';

class GetChars implements BaseUseCase<CharFailure, List<CharBusiness>, int> {
  late final CharRepository charRepository;

  GetChars({required this.charRepository});

  @override
  Future<Either<CharFailure, List<CharBusiness>>> call(int params) =>
      charRepository.getChars(params);
}
