import 'dart:convert';

import 'package:data/operations/books/book_remote_data_source.dart';
import 'package:data/operations/books/book_response.dart';
import 'package:data/operations/books/book_service.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_remote_data_source_test.mocks.dart';

@GenerateMocks([BookService])
void main() {
  var bookRemoteDataSource;
  var mockService = MockBookService();

  setUp(() {
    bookRemoteDataSource = BookRemoteDataSource(bookService: mockService);
  });

  const BOOK_TYPE = 1;

  final jsonResponse = jsonDecode(
      '[{\"name\":\"A Game of Thrones\",\"isbn\":\"978-0553103540\",\"authors\":[\"George R. R. Martin\"],\"numberOfPages\":694,\"publisher\":\"Bantam Books\",\"country\":\"United States\",\"mediaType\":\"Hardcover\",\"released\":\"1996-08-01T00:00:00\"}]');

  final expectedResult = [
    BookResponse(
        name: 'A Game of Thrones',
        isbn: '978-0553103540',
        authors: ['George R. R. Martin'],
        numberOfPages: 694,
        publisher: 'Bantam Books',
        country: 'United States',
        mediaType: 'Hardcover',
        released: '1996-08-01T00:00:00')
  ];

  test('Get books - Success', () async {
    // Given
    when(mockService.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => jsonResponse);

    // When
    final result = await bookRemoteDataSource.getBooks(BOOK_TYPE);

    // Then
    expect(result, expectedResult);

    verify(mockService.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockService);
  });

  test('Get books - No internet', () async {
    // Given
    when(mockService.getBooks(BOOK_TYPE)).thenThrow(NoInternet());

    // Then
    expect(() => bookRemoteDataSource.getBooks(BOOK_TYPE),
        throwsA(isInstanceOf<NoInternet>()));
  });

  test('Get books - Repository exception', () async {
    // Given
    when(mockService.getBooks(BOOK_TYPE)).thenThrow(RepositoryException());

    // Then
    expect(() => bookRemoteDataSource.getBooks(BOOK_TYPE),
        throwsA(isInstanceOf<RepositoryException>()));
  });

  test('Get books - Fromat exception', () async {
    // Given
    when(mockService.getBooks(BOOK_TYPE)).thenThrow(FormatException());

    // Then
    expect(() => bookRemoteDataSource.getBooks(BOOK_TYPE),
        throwsA(isInstanceOf<FormatException>()));
  });

  test('Get books - Unknown', () async {
    // Given
    when(mockService.getBooks(BOOK_TYPE)).thenThrow(Unknown());

    // Then
    expect(() => bookRemoteDataSource.getBooks(BOOK_TYPE),
        throwsA(isInstanceOf<Unknown>()));
  });
}
