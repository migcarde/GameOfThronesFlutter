import 'package:dartz/dartz.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/chars/char_business.dart';
import 'package:domain/operations/chars/char_failure.dart';
import 'package:domain/operations/chars/char_repository.dart';
import 'package:domain/operations/chars/get_chars.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_chars_test.mocks.dart';

@GenerateMocks([CharRepository])
void main() {
  late GetChars getChars;
  var mockCharRepository = MockCharRepository();

  setUp(() {
    getChars = GetChars(charRepository: mockCharRepository);
  });

  const CHAR_TYPE = 3;

  final expectedResult = [
    CharBusiness(
        id: '2',
        name: 'Walder',
        gender: 'Male',
        titles: [],
        aliases: ['Hodor'],
        allegiances: ['http://www.anapioficeandfire.com/api/houses/362'],
        playedBy: ['Kristian Nairn'])
  ];

  test('Get chars - Success', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> right = Right(expectedResult);
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => right);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, right);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });

  test('Get chars - Get char error', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> left = Left(GetCharError());
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, left);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });

  test('Get chars - Repository exception', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> left =
        Left(CharRepositoryFailure(failure: RepositoryException()));
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, left);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });

  test('Get chars - No internet', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> left =
        Left(CharRepositoryFailure(failure: NoInternet()));
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, left);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });

  test('Get chars - Unauthorized', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> left =
        Left(CharRepositoryFailure(failure: Unauthorized()));
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, left);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });

  test('Get chars - Server error', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> left =
        Left(CharRepositoryFailure(failure: ServerError()));
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, left);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });

  test('Get chars - Unknown exception', () async {
    // Given
    final Either<CharFailure, List<CharBusiness>> left =
        Left(CharRepositoryFailure(failure: Unknown()));
    when(mockCharRepository.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getChars.call(CHAR_TYPE);

    // Then
    expect(result, left);

    verify(mockCharRepository.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharRepository);
  });
}
