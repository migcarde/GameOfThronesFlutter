import 'package:data/network_manager.dart';
import 'package:data/operations/houses/house_remote_data_source.dart';
import 'package:data/operations/houses/house_repository_impl.dart';
import 'package:data/operations/houses/house_response.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'house_repository_impl_test.mocks.dart';

@GenerateMocks([HouseRemoteDataSource, NetworkManager])
void main() {
  late HouseRepositoryImpl houseRepository;
  var mockHouseRemoteDataSource = MockHouseRemoteDataSource();
  var mockNetworkManager = MockNetworkManager();

  setUp(() {
    houseRepository = HouseRepositoryImpl(
        houseRemoteDataSource: mockHouseRemoteDataSource,
        networkManager: mockNetworkManager);
  });

  const HOUSE_TYPE = 2;

  final responseHouses = [
    HouseResponse(
        id: '1',
        name: 'House Algood',
        region: 'The Westerlands',
        title:
            'A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)')
  ];

  test('Get houses - Success', () async {
    // Given
    when(mockHouseRemoteDataSource.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => responseHouses);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await houseRepository.getHouses(HOUSE_TYPE);

    // Then
    verify(houseRepository.getHouses(HOUSE_TYPE));
    expect(result.isRight(), true);
  });

  test('Get houses - Throws no internet', () async {
    // Given
    when(mockHouseRemoteDataSource.getHouses(HOUSE_TYPE))
        .thenAnswer((realInvocation) async => responseHouses);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => false);

    // When
    final result = await houseRepository.getHouses(HOUSE_TYPE);

    // Then
    verify(houseRepository.getHouses(HOUSE_TYPE));
    expect(result.isLeft(), true);
  });

  test('Get houses - No internet', () async {
    // Given
    when(mockHouseRemoteDataSource.getHouses(HOUSE_TYPE))
        .thenThrow(NoInternet());
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await houseRepository.getHouses(HOUSE_TYPE);

    // Then
    verify(houseRepository.getHouses(HOUSE_TYPE));
    expect(result.isLeft(), true);
  });

  test('Get houses - Unknown failure', () async {
    // Given
    when(mockHouseRemoteDataSource.getHouses(HOUSE_TYPE)).thenThrow(Unknown());
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await houseRepository.getHouses(HOUSE_TYPE);

    // Then
    verify(houseRepository.getHouses(HOUSE_TYPE));
    expect(result.isLeft(), true);
  });
}
