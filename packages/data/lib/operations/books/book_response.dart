import 'package:equatable/equatable.dart';

class BookResponse extends Equatable {
  late final String name;
  late final String isbn;
  late final List<String> authors;
  late final int numberOfPages;
  late final String publisher;
  late final String country;
  late final String mediaType;
  late final String released;

  BookResponse(
      {required this.name,
      required this.isbn,
      required this.authors,
      required this.numberOfPages,
      required this.publisher,
      required this.country,
      required this.mediaType,
      required this.released});

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
      name: json['name'],
      isbn: json['isbn'],
      authors: List<String>.from(json['authors']),
      numberOfPages: json['numberOfPages'],
      publisher: json['publisher'],
      country: json['country'],
      mediaType: json['mediaType'],
      released: json['released']);

  @override
  List<Object?> get props => [
        name,
        isbn,
        authors,
        numberOfPages,
        publisher,
        country,
        mediaType,
        released
      ];
}
