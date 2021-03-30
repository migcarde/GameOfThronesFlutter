import 'package:data/operations/houses/house_response.dart';
import 'package:equatable/equatable.dart';

class HouseBusiness extends Equatable {
  late final String id;
  late final String name;
  late final String region;
  late final String? title;

  HouseBusiness(
      {required this.id,
      required this.name,
      required this.region,
      required this.title});

  factory HouseBusiness.fromResponse(HouseResponse response) => HouseBusiness(
      id: response.id,
      name: response.name,
      region: response.region,
      title: response.title);

  @override
  List<Object?> get props => [id, name, region, title];
}
