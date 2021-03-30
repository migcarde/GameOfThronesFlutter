import 'package:dartz/dartz.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/houses/get_houses.dart';
import 'package:domain/operations/houses/house_business.dart';
import 'package:domain/operations/houses/house_failure.dart';
import 'package:domain/operations/houses/house_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_houses_test.mocks.dart';

@GenerateMocks([HouseRepository])
void main() {
  late GetHouses getHouses;
  var mockHouseRepository = MockHouseRepository();

  setUp(() {
    getHouses = GetHouses(houseRepository: mockHouseRepository);
  });

  const HOUSE_TYPE = 2;

  final expectedResult = [
    HouseBusiness(
        id: '1',
        name: 'House Algood',
        region: 'The Westerlands',
        title:
            'A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)')
  ];

  test('Get houses - Success', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> right =
        Right(expectedResult);
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => right);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, right);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });

  test('Get houses - Get house error', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(GetHouseError());
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });

  test('Get houses - Get house error', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(GetHouseError());
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });

  test('Get houses - Repository exception', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(HouseRepositoryFailure(failure: RepositoryException()));
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });
  test('Get houses - No internet', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(HouseRepositoryFailure(failure: NoInternet()));
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });

  test('Get houses - Unauthorized', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(HouseRepositoryFailure(failure: Unauthorized()));
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });

  test('Get houses - Server error', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(HouseRepositoryFailure(failure: ServerError()));
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });

  test('Get houses - Unknown exception', () async {
    // Given
    final Either<HouseFailure, List<HouseBusiness>> left =
        Left(HouseRepositoryFailure(failure: Unknown()));
    when(mockHouseRepository.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getHouses.call(HOUSE_TYPE);

    // Then
    expect(result, left);

    verify(mockHouseRepository.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseRepository);
  });
}
