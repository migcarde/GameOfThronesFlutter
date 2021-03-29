import 'package:data/network_manager.dart';
import 'package:data/operations/books/book_remote_data_source.dart';
import 'package:data/operations/books/book_repository_impl.dart';
import 'package:data/operations/books/book_response.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_repository_impl_test.mocks.dart';

@GenerateMocks([BookRemoteDataSource, NetworkManager])
void main() {
  late BookRepositoryImpl bookRepository;
  var mockRemoteDataSource = MockBookRemoteDataSource();
  var mockNetworkManager = MockNetworkManager();

  setUp(() {
    bookRepository = BookRepositoryImpl(
        bookRemoteDataSource: mockRemoteDataSource,
        networkManager: mockNetworkManager);
  });

  tearDown(() {
    resetMockitoState();
  });

  const BOOK_TYPE = 1;

  final responseBooks = [
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

  test('Get remote categories - Success', () async {
    // Given
    when(mockRemoteDataSource.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => responseBooks);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await bookRepository.getBooks(BOOK_TYPE);

    // Then
    verify(bookRepository.getBooks(BOOK_TYPE));
    expect(result.isRight(), true);
  });

  test('Get remote categories - Throws no internet', () async {
    // Given
    when(mockRemoteDataSource.getBooks(BOOK_TYPE))
        .thenAnswer((realInvocation) async => responseBooks);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => false);

    // When
    final result = await bookRepository.getBooks(BOOK_TYPE);

    // Then
    verify(bookRepository.getBooks(BOOK_TYPE));
    expect(result.isLeft(), true);
  });

  test('Get remote categories - No internet', () async {
    // Given
    when(mockRemoteDataSource.getBooks(BOOK_TYPE)).thenThrow(NoInternet());
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await bookRepository.getBooks(BOOK_TYPE);

    // Then
    verify(bookRepository.getBooks(BOOK_TYPE));
    expect(result.isLeft(), true);
  });

  test('Get remote categories - Unknown failure', () async {
    // Given
    when(mockRemoteDataSource.getBooks(BOOK_TYPE)).thenThrow(Unknown());
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => false);

    // When
    final result = await bookRepository.getBooks(BOOK_TYPE);

    // Then
    verify(bookRepository.getBooks(BOOK_TYPE));
    expect(result.isLeft(), true);
  });
}
