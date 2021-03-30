import 'package:equatable/equatable.dart';

class HouseResponse extends Equatable {
  late final String id;
  late final String name;
  late final String region;
  late final String? title;

  HouseResponse(
      {required this.id,
      required this.name,
      required this.region,
      required this.title});

  factory HouseResponse.fromJson(Map<String, dynamic> json) => HouseResponse(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      title: json['title']);

  @override
  List<Object?> get props => [id, name, region, title];
}
