import 'package:domain/operations/books/book_business.dart';
import 'package:equatable/equatable.dart';

class BookViewEntity extends Equatable {
  late final String name;
  late final String isbn;
  late final List<String> authors;
  late final int numberOfPages;
  late final String publisher;
  late final String country;
  late final String mediaType;
  late final String released;

  BookViewEntity(
      {required this.name,
      required this.isbn,
      required this.authors,
      required this.numberOfPages,
      required this.publisher,
      required this.country,
      required this.mediaType,
      required this.released});

  factory BookViewEntity.fromBusiness(BookBusiness business) => BookViewEntity(
      name: business.name,
      isbn: business.isbn,
      authors: business.authors,
      numberOfPages: business.numberOfPages,
      publisher: business.publisher,
      country: business.country,
      mediaType: business.mediaType,
      released: business.released);

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
