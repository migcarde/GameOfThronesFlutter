import 'dart:convert';

import 'package:data/operations/houses/house_remote_data_source.dart';
import 'package:data/operations/houses/house_response.dart';
import 'package:data/operations/houses/house_service.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'house_remote_data_source_test.mocks.dart';

@GenerateMocks([HouseService])
void main() {
  late HouseRemoteDataSource houseRemoteDataSource;
  var mockHouseService = MockHouseService();

  setUp(() {
    houseRemoteDataSource =
        HouseRemoteDataSource(houseService: mockHouseService);
  });

  const HOUSE_TYPE = 2;

  final jsonResponse = jsonDecode(
      '[\n  {\n    \"id\": \"1\",\n    \"name\": \"House Algood\",\n    \"region\": \"The Westerlands\",\n    \"title\": \"A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)\"\n  }\n]');
  final expectedResult = [
    HouseResponse(
        id: '1',
        name: 'House Algood',
        region: 'The Westerlands',
        title:
            'A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)')
  ];

  test('Get houses - Success', () async {
    // Given
    when(mockHouseService.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => jsonResponse);

    // When
    final result = await houseRemoteDataSource.getHouses(HOUSE_TYPE);

    // Then
    expect(result, expectedResult);

    verify(mockHouseService.getHouses(HOUSE_TYPE));
    verifyNoMoreInteractions(mockHouseService);
  });

  test('Get houses - No internet', () async {
    // Given
    when(mockHouseService.getHouses(HOUSE_TYPE)).thenThrow(NoInternet());

    // Then
    expect(() => houseRemoteDataSource.getHouses(HOUSE_TYPE),
        throwsA(isInstanceOf<NoInternet>()));
  });

  test('Get houses - Repository exception', () async {
    // Given
    when(mockHouseService.getHouses(HOUSE_TYPE))
        .thenThrow(RepositoryException());

    // Then
    expect(() => houseRemoteDataSource.getHouses(HOUSE_TYPE),
        throwsA(isInstanceOf<RepositoryException>()));
  });

  test('Get houses - Format exception', () async {
    // Given
    when(mockHouseService.getHouses(HOUSE_TYPE)).thenThrow(FormatException());

    // Then
    expect(() => houseRemoteDataSource.getHouses(HOUSE_TYPE),
        throwsA(isInstanceOf<FormatException>()));
  });

  test('Get houses - Unknown', () async {
    // Given
    when(mockHouseService.getHouses(HOUSE_TYPE)).thenThrow(Unknown());

    // Then
    expect(() => houseRemoteDataSource.getHouses(HOUSE_TYPE),
        throwsA(isInstanceOf<Unknown>()));
  });
}
