import 'package:equatable/equatable.dart';

class BookBusiness extends Equatable {
  late final String name;
  late final String isbn;
  late final List<String> authors;
  late final int numberOfPages;
  late final String publisher;
  late final String country;
  late final String mediaType;
  late final String released;

  BookBusiness(
      {required this.name,
      required this.isbn,
      required this.authors,
      required this.numberOfPages,
      required this.publisher,
      required this.country,
      required this.mediaType,
      required this.released});

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
