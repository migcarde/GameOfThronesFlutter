import 'package:dartz/dartz.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/operations/houses/house_business.dart';
import 'package:domain/operations/houses/house_failure.dart';
import 'package:domain/operations/houses/house_repository.dart';

class GetHouses extends BaseUseCase<HouseFailure, List<HouseBusiness>, int> {
  late final HouseRepository houseRepository;

  GetHouses({required this.houseRepository});

  @override
  Future<Either<HouseFailure, List<HouseBusiness>>> call(int params) =>
      houseRepository.getHouses(params);
}
