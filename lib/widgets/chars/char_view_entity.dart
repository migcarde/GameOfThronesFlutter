import 'package:domain/operations/chars/char_business.dart';
import 'package:equatable/equatable.dart';

class CharViewEntity extends Equatable {
  late final String id;
  late final String name;
  late final String gender;
  late final String? culture;
  late final String? born;
  late final String? died;
  late final List<String> titles;
  late final List<String> aliases;
  late final String? father;
  late final String? mother;
  late final String? spouse;
  late final List<String> allegiances;
  late final List<String> playedBy;

  CharViewEntity({
    required this.id,
    required this.name,
    required this.gender,
    this.culture,
    this.born,
    this.died,
    required this.titles,
    required this.aliases,
    this.father,
    this.mother,
    this.spouse,
    required this.allegiances,
    required this.playedBy,
  });

  factory CharViewEntity.fromBusiness(CharBusiness business) => CharViewEntity(
      id: business.id,
      name: business.name,
      gender: business.gender,
      culture: business.culture,
      born: business.born,
      died: business.died,
      titles: business.titles,
      aliases: business.aliases,
      father: business.father,
      mother: business.mother,
      spouse: business.spouse,
      allegiances: business.allegiances,
      playedBy: business.playedBy);

  @override
  List<Object?> get props => [
        id,
        name,
        gender,
        culture,
        born,
        died,
        titles,
        aliases,
        father,
        mother,
        spouse,
        allegiances,
        playedBy
      ];
}
