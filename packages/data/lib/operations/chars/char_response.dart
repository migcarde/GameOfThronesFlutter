import 'package:domain/operations/chars/char_business.dart';
import 'package:equatable/equatable.dart';

class CharResponse extends Equatable {
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

  CharResponse({
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

  factory CharResponse.fromJson(Map<String, dynamic> json) {
    json.removeWhere((key, value) => key.isEmpty || value.toString().isEmpty);

    return CharResponse(
        id: json['id'],
        name: json['name'],
        gender: json['gender'],
        culture: json['culture'],
        born: json['born'],
        died: json['died'],
        titles: List<String>.from(json['titles']),
        aliases: List<String>.from(json['aliases']),
        father: json['father'],
        mother: json['mother'],
        spouse: json['spouse'],
        allegiances: List<String>.from(json['allegiances']),
        playedBy: List<String>.from(json['playedBy']));
  }

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

extension CharResponseParsing on CharResponse {
  CharBusiness toDomain() => CharBusiness(
      id: this.id,
      name: this.name,
      gender: this.gender,
      culture: this.culture,
      born: this.born,
      died: this.died,
      titles: this.titles,
      aliases: this.aliases,
      father: this.father,
      mother: this.mother,
      spouse: this.spouse,
      allegiances: this.allegiances,
      playedBy: this.playedBy);
}
