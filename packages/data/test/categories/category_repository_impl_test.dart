import 'package:data/network_manager.dart';
import 'package:data/operations/categories/category_hive_model.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/operations/categories/category_repository_impl.dart';
import 'package:data/operations/categories/category_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_repository_impl_test.mocks.dart';

@GenerateMocks(
    [CategoryRemoteDataSource, CategoryLocalDataSource, NetworkManager])
void main() {
  var categoryRepository;
  var mockCategoryRemoteDataSource = MockCategoryRemoteDataSource();
  var mockCategoryLocalDataSource = MockCategoryLocalDataSource();
  var mockNetworkManager = MockNetworkManager();

  setUp(() {
    categoryRepository = CategoryRepositoryImpl(
        categoryRemoteDataSource: mockCategoryRemoteDataSource,
        categoryLocalDataSource: mockCategoryLocalDataSource,
        networkManager: mockNetworkManager);
  });

  tearDown(() {
    resetMockitoState();
  });

  final hiveCategories = [CategoryHiveModel(type: 0, categoryName: 'example')];
  final responseCategories = [
    CategoryResponse(type: 0, categoryName: 'example')
  ];

  test('Get local categories - Success', () async {
    // Given
    when(mockCategoryLocalDataSource.getCategories())
        .thenAnswer((realInvocation) async => hiveCategories);

    // When
    final result = await categoryRepository.getLocalCategories();

    // Then
    verify(mockCategoryLocalDataSource.getCategories());
    expect(result.isRight(), true);
  });

  test('Get local categories - Unknown failure', () async {
    // Given
    when(mockCategoryLocalDataSource.getCategories()).thenThrow(Exception);

    // When
    final result = await categoryRepository.getLocalCategories();

    // Then
    expect(result.isLeft(), true);
  });

  test('Get remote categories - Success', () async {
    // Given
    when(mockCategoryRemoteDataSource.getCategories())
        .thenAnswer((realInvocation) async => responseCategories);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => true);

    // When
    final result = await categoryRepository.getCategories();

    // Then
    expect(result.isRight(), true);
  });

  test('Get remote categories - Failure', () async {
    // Given
    when(mockCategoryRemoteDataSource.getCategories())
        .thenAnswer((realInvocation) async => responseCategories);
    when(mockNetworkManager.hasInternetConnection)
        .thenAnswer((realInvocation) async => false);

    // When
    final result = await categoryRepository.getCategories();

    // Then
    expect(result.isLeft(), true);
  });
}
