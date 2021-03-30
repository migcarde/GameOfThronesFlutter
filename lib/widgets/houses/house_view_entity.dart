import 'package:domain/operations/houses/house_business.dart';
import 'package:equatable/equatable.dart';

const NORTH = 'the north';
const VALE = 'the vale';
const RIVERLANDS = 'the riverlands';
const IRON_ISLANDS = 'iron islands';
const WESTERLANDS = 'the westerlands';
const REACH = 'the reach';
const DORNE = 'dorne';
const STORMLANDS = 'the stormlands';

class HouseViewEntity extends Equatable {
  late final String id;
  late final String name;
  late final String region;
  late final String? title;
  late final String? picture;

  HouseViewEntity(
      {required this.id,
      required this.name,
      required this.region,
      required this.title,
      this.picture});

  factory HouseViewEntity.fromBusiness(HouseBusiness business) =>
      HouseViewEntity(
          id: business.id,
          name: business.name,
          region: business.region,
          title: business.title,
          picture: _getPicture(business.region));

  @override
  List<Object?> get props => [id, name, region, title];
}

String? _getPicture(String region) {
  String? result;
  final regionLowerCase = region.toLowerCase();

  if (regionLowerCase == NORTH) {
    result = 'https://bit.ly/2Gcq0r4';
  } else if (regionLowerCase == VALE) {
    result = 'https://bit.ly/34FAvws';
  } else if (regionLowerCase == RIVERLANDS || region == IRON_ISLANDS) {
    result = 'https://bit.ly/3kJrIiP';
  } else if (regionLowerCase == WESTERLANDS) {
    result = 'https://bit.ly/2TAzjnO';
  } else if (regionLowerCase == REACH) {
    result = 'https://bit.ly/2HSCW5N';
  } else if (regionLowerCase == DORNE) {
    result = 'https://bit.ly/2HOcavT';
  } else if (regionLowerCase == STORMLANDS) {
    result = 'https://bit.ly/34F2sEC';
  }

  return result;
}
