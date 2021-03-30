import 'package:data/operations/houses/house_response.dart';
import 'package:data/operations/houses/house_service.dart';

class HouseRemoteDataSource {
  late final HouseService houseService;

  HouseRemoteDataSource({required this.houseService});

  Future<List<HouseResponse>> getHouses(int type) async {
    final response = await houseService.getHouses(type);

    return response.map((json) => HouseResponse.fromJson(json)).toList();
  }
}
