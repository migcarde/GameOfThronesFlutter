import 'dart:convert';

import 'package:data/operations/chars/char_remote_data_source.dart';
import 'package:data/operations/chars/char_response.dart';
import 'package:data/operations/chars/char_service.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'char_remote_data_source_test.mocks.dart';

@GenerateMocks([CharService])
void main() {
  late CharRemoteDataSource charRemoteDataSource;
  var mockCharService = MockCharService();

  setUp(() {
    charRemoteDataSource = CharRemoteDataSource(charService: mockCharService);
  });

  const CHAR_TYPE = 3;

  final jsonResponse = jsonDecode(
      '[\n  {\n    \"id\": \"2\",\n    \"name\": \"Walder\",\n    \"gender\": \"Male\",\n    \"culture\": \"\",\n    \"born\": \"\",\n    \"died\": \"\",\n    \"titles\": [],\n    \"aliases\": [\n      \"Hodor\"\n    ],\n    \"father\": \"\",\n    \"mother\": \"\",\n    \"spouse\": \"\",\n    \"allegiances\": [\n      \"http://www.anapioficeandfire.com/api/houses/362\"\n    ],\n    \"playedBy\": [\n      \"Kristian Nairn\"\n    ]\n  }\n]');

  final expectedResult = [
    CharResponse(
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
    when(mockCharService.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => jsonResponse);

    // When
    final result = await charRemoteDataSource.getChars(CHAR_TYPE);

    // Then
    expect(result, expectedResult);

    verify(mockCharService.getChars(CHAR_TYPE));
    verifyNoMoreInteractions(mockCharService);
  });

  test('Get chars - No internet', () async {
    // Given
    when(mockCharService.getChars(CHAR_TYPE)).thenThrow(NoInternet());

    // Then
    expect(() => charRemoteDataSource.getChars(CHAR_TYPE),
        throwsA(isInstanceOf<NoInternet>()));
  });

  test('Get chars - Repository exception', () async {
    // Given
    when(mockCharService.getChars(CHAR_TYPE)).thenThrow(RepositoryException());

    // Then
    expect(() => charRemoteDataSource.getChars(CHAR_TYPE),
        throwsA(isInstanceOf<RepositoryException>()));
  });

  test('Get chars - Format exception', () async {
    // Given
    when(mockCharService.getChars(CHAR_TYPE)).thenThrow(FormatException());

    // Then
    expect(() => charRemoteDataSource.getChars(CHAR_TYPE),
        throwsA(isInstanceOf<FormatException>()));
  });

  test('Get chars - Unknown', () async {
    // Given
    when(mockCharService.getChars(CHAR_TYPE)).thenThrow(Unknown());

    // Then
    expect(() => charRemoteDataSource.getChars(CHAR_TYPE),
        throwsA(isInstanceOf<Unknown>()));
  });
}
