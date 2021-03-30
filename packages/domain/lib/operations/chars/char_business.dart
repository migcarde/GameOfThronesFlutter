import 'package:data/operations/chars/char_response.dart';
import 'package:equatable/equatable.dart';

class CharBusiness extends Equatable {
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

  CharBusiness({
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

  factory CharBusiness.fromResponse(CharResponse response) => CharBusiness(
      id: response.id,
      name: response.name,
      gender: response.gender,
      culture: response.culture,
      born: response.born,
      died: response.died,
      titles: response.titles,
      aliases: response.aliases,
      father: response.father,
      mother: response.mother,
      spouse: response.spouse,
      allegiances: response.allegiances,
      playedBy: response.playedBy);

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
