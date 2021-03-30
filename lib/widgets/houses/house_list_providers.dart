import 'package:data/repository_failure.dart';
import 'package:domain/operations/houses/get_houses.dart';
import 'package:domain/operations/houses/house_business.dart';
import 'package:domain/operations/houses/house_failure.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/injection_container.dart';
import 'package:game_of_thrones/widgets/houses/house_view_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _getHouses = locator<GetHouses>();

final housesFutureProvider =
    FutureProvider.autoDispose.family<BaseListState, int>((ref, type) async {
  final call = await _getHouses.call(type);

  return call.fold(
      (l) => _handleHousesError(l), (r) => _handleHousesSuscces(r));
});

Future<BaseListState> _handleHousesSuscces(List<HouseBusiness> houses) async {
  if (houses.isEmpty) {
    return Empty();
  } else {
    final housesViewEntity = houses
        .map((business) => HouseViewEntity.fromBusiness(business))
        .toList();
    return Result<HouseViewEntity>(result: housesViewEntity);
  }
}

Error _handleHousesError(HouseFailure failure) {
  if (failure is HouseRepositoryFailure) {
    return _handleRepositoryFailure(failure);
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}

// Not considered cases like unauthorized or repository exception
Error _handleRepositoryFailure(HouseRepositoryFailure houseRepositoryFailure) {
  if (houseRepositoryFailure.failure is NoInternet) {
    return Error(message: 'No internet');
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}
