import 'package:dartz/dartz.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/books/book_business.dart';
import 'package:domain/operations/books/book_failure.dart';
import 'package:domain/operations/books/book_repository.dart';
import 'package:domain/operations/books/get_books.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_books_test.mocks.dart';

@GenerateMocks([BookRepository])
void main() {
  late GetBooks getBooks;
  var mockBookRepository = MockBookRepository();

  setUp(() {
    getBooks = GetBooks(bookRepository: mockBookRepository);
  });

  const BOOK_TYPE = 1;

  final expectedResult = [
    BookBusiness(
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
    final Either<BookFailure, List<BookBusiness>> right = Right(expectedResult);
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => right);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, right);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });

  test('Get books - Get book error', () async {
    // Given
    final Either<BookFailure, List<BookBusiness>> left = Left(GetBookError());
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, left);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });

  test('Get books - Repository exception', () async {
    // Given
    final Either<BookFailure, List<BookBusiness>> left =
        Left(BookRepositoryFailure(failure: RepositoryException()));
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, left);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });

  test('Get books - No internet', () async {
    // Given
    final Either<BookFailure, List<BookBusiness>> left =
        Left(BookRepositoryFailure(failure: NoInternet()));
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, left);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });

  test('Get books - Unauthorized', () async {
    // Given
    final Either<BookFailure, List<BookBusiness>> left =
        Left(BookRepositoryFailure(failure: Unauthorized()));
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, left);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });

  test('Get books - Server error', () async {
    // Given
    final Either<BookFailure, List<BookBusiness>> left =
        Left(BookRepositoryFailure(failure: ServerError()));
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, left);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });

  test('Get books - Unknown exception', () async {
    // Given
    final Either<BookFailure, List<BookBusiness>> left =
        Left(BookRepositoryFailure(failure: Unknown()));
    when(mockBookRepository.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getBooks.call(BOOK_TYPE);

    expect(result, left);

    verify(mockBookRepository.getBooks(BOOK_TYPE));
    verifyNoMoreInteractions(mockBookRepository);
  });
}
