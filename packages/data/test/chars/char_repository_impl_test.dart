import 'package:data/network_manager.dart';
import 'package:data/operations/chars/char_remote_data_source.dart';
import 'package:data/operations/chars/char_repository_impl.dart';
import 'package:data/operations/chars/char_response.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'char_repository_impl_test.mocks.dart';

@GenerateMocks([CharRemoteDataSource, NetworkManager])
void main() {
  late CharRepositoryImpl charRepositoryImpl;
  var mockCharRemoteDataSource = MockCharRemoteDataSource();
  var mockNetworkManager = MockNetworkManager();

  setUp(() {
    charRepositoryImpl = CharRepositoryImpl(
        charRemoteDataSource: mockCharRemoteDataSource,
        networkManager: mockNetworkManager);
  });

  const CHAR_TYPE = 3;

  final responseChars = [
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
    when(mockCharRemoteDataSource.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => responseChars);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await charRepositoryImpl.getChars(CHAR_TYPE);

    verify(charRepositoryImpl.getChars(CHAR_TYPE));
    expect(result.isRight(), true);
  });

  test('Get chars - Throws no internet', () async {
    // Given
    when(mockCharRemoteDataSource.getChars(CHAR_TYPE))
        .thenAnswer((realInvocation) async => responseChars);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => false);

    // When
    final result = await charRepositoryImpl.getChars(CHAR_TYPE);

    verify(charRepositoryImpl.getChars(CHAR_TYPE));
    expect(result.isLeft(), true);
  });

  test('Get chars - No internet', () async {
    // Given
    when(mockCharRemoteDataSource.getChars(CHAR_TYPE)).thenThrow(NoInternet());
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await charRepositoryImpl.getChars(CHAR_TYPE);

    verify(charRepositoryImpl.getChars(CHAR_TYPE));
    expect(result.isLeft(), true);
  });

  test('Get chars - Unknown failure', () async {
    // Given
    when(mockCharRemoteDataSource.getChars(CHAR_TYPE)).thenThrow(Unknown());
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await charRepositoryImpl.getChars(CHAR_TYPE);

    verify(charRepositoryImpl.getChars(CHAR_TYPE));
    expect(result.isLeft(), true);
  });
}
