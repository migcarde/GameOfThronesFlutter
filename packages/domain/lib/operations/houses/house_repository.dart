import 'package:dartz/dartz.dart';
import 'package:domain/operations/houses/house_business.dart';
import 'package:domain/operations/houses/house_failure.dart';

abstract class HouseRepository {
  Future<Either<HouseFailure, List<HouseBusiness>>> getHouses(int type);
}
