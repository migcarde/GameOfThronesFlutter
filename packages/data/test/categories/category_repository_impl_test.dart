import 'package:data/operations/categories/category_hive_model.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/operations/categories/category_repository_impl.dart';
import 'package:data/operations/categories/category_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_repository_impl_test.mocks.dart';

@GenerateMocks([CategoryRemoteDataSource, CategoryLocalDataSource])
void main() {
  var categoryRepository;
  var categoryRemoteDataSource = MockCategoryRemoteDataSource();
  var categoryLocalDataSource = MockCategoryLocalDataSource();

  setUp(() {
    categoryRepository = CategoryRepositoryImpl(
        categoryRemoteDataSource: categoryRemoteDataSource,
        categoryLocalDataSource: categoryLocalDataSource);
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
    when(categoryLocalDataSource.getCategories())
        .thenAnswer((realInvocation) async => hiveCategories);

    // When
    final result = await categoryRepository.getLocalCategories();

    // Then
    verify(categoryLocalDataSource.getCategories());
    expect(result.isRight(), true);
  });

  test('Get local categories - Unknown Failure', () async {
    // Given
    when(categoryLocalDataSource.getCategories()).thenThrow(Exception);

    // When
    final result = await categoryRepository.getLocalCategories();

    // Then
    expect(result.isLeft(), true);
  });

  test('Get remote categories - Success', () async {
    // Given
    when(categoryRemoteDataSource.getCategories())
        .thenAnswer((realInvocation) async => responseCategories);

    // When
    final result = await categoryRepository.getCategories();

    // Then
    expect(result.isRight(), true);
  });

  test('Get remote categories - Failure', () async {
    // Given
    when(categoryRemoteDataSource.getCategories())
        .thenAnswer((realInvocation) async => responseCategories);

    // When
    final result = await categoryRepository.getCategories();

    // Then
    expect(result.isLeft(), true);
  });
}
