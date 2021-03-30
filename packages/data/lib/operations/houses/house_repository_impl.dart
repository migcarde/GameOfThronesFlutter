import 'package:data/network_manager.dart';
import 'package:data/operations/houses/house_remote_data_source.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/houses/house_failure.dart';
import 'package:domain/operations/houses/house_business.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/operations/houses/house_repository.dart';
import 'package:data/operations/houses/house_response.dart';

class HouseRepositoryImpl extends HouseRepository {
  late final HouseRemoteDataSource houseRemoteDataSource;
  late final NetworkManager networkManager;

  HouseRepositoryImpl(
      {required this.houseRemoteDataSource, required this.networkManager});

  @override
  Future<Either<HouseFailure, List<HouseBusiness>>> getHouses(int type) async {
    try {
      if (await networkManager.hasInternetConnection) {
        final houses = await houseRemoteDataSource.getHouses(type);

        final result = houses.map((response) => response.toDomain()).toList();

        return Right(result);
      } else {
        throw NoInternet();
      }
    } on RepositoryFailure catch (failure) {
      return Left(HouseRepositoryFailure(failure: failure));
    } on GetHouseError {
      return Left(GetHouseError());
    }
  }
}
