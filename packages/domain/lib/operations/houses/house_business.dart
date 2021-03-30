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

  @override
  List<Object?> get props => [id, name, region, title];
}
