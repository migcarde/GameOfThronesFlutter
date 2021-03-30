import 'package:dartz/dartz.dart';
import 'package:data/network_manager.dart';
import 'package:data/operations/chars/char_remote_data_source.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/chars/char_failure.dart';
import 'package:domain/operations/chars/char_business.dart';
import 'package:domain/operations/chars/char_repository.dart';

class CharRepositoryImpl implements CharRepository {
  late final CharRemoteDataSource charRemoteDataSource;
  late final NetworkManager networkManager;

  CharRepositoryImpl(
      {required this.charRemoteDataSource, required this.networkManager});

  @override
  Future<Either<CharFailure, List<CharBusiness>>> getChars(int type) async {
    try {
      if (await networkManager.hasInternetConnection) {
        final chars = await charRemoteDataSource.getChars(type);

        final results = chars
            .map((response) => CharBusiness.fromResponse(response))
            .toList();

        return Right(results);
      } else {
        throw NoInternet();
      }
    } on RepositoryFailure catch (failure) {
      return Left(CharRepositoryFailure(failure: failure));
    } catch (e) {
      return Left(GetCharError());
    }
  }
}
