import 'dart:convert';

import 'package:common_flutter/network_manager.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/operations/categories/category_response.dart';
import 'package:data/operations/categories/category_service.dart';
import 'package:data/repository_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_remote_data_source_test.mocks.dart';

@GenerateMocks([CategoryService])
void main() {
  var remoteDataSource;
  var mockCategoryService = MockCategoryService();

  setUp(() {
    remoteDataSource =
        CategoryRemoteDataSource(categoryService: mockCategoryService);
  });

  tearDown(() {
    resetMockitoState();
  });

  final jsonResponse = jsonDecode(
      '[{\"category_name\":\"Books\",\"type\":0},{\"category_name\":\"Houses\",\"type\":1},{\"category_name\":\"Characters\",\"type\":2}]');

  final expectedResult = [
    CategoryResponse(categoryName: 'Books', type: 0),
    CategoryResponse(categoryName: 'Houses', type: 1),
    CategoryResponse(categoryName: 'Characters', type: 2)
  ];

  test('Get categories - Success', () async {
    // Given
    when(mockCategoryService.getCategories())
        .thenAnswer((realInvocation) async => jsonResponse);

    // When

    final result = await remoteDataSource.getCategories();

    // Then
    expect(result, expectedResult);

    verify(mockCategoryService.getCategories());
    verifyNoMoreInteractions(mockCategoryService);
  });

  test('Get categories - No internet', () async {
    // Given
    when(mockCategoryService.getCategories()).thenThrow(NoInternet());

    //Then
    expect(() => mockCategoryService.getCategories(),
        throwsA(isInstanceOf<NoInternet>()));
  });

  test('Get categories - Repository exception', () async {
    // Given
    when(mockCategoryService.getCategories()).thenThrow(RepositoryException());

    // Then
    expect(() => mockCategoryService.getCategories(),
        throwsA(isInstanceOf<RepositoryException>()));
  });

  test('Get categories - Format exception', () async {
    // Given
    when(mockCategoryService.getCategories()).thenThrow(FormatException());

    // Then
    expect(() => mockCategoryService.getCategories(),
        throwsA(isInstanceOf<FormatException>()));
  });

  test('Get categories - Unknown', () async {
    // Given
    when(mockCategoryService.getCategories()).thenThrow(Unknown());

    // Then
    expect(() => mockCategoryService.getCategories(),
        throwsA(isInstanceOf<Unknown>()));
  });
}
