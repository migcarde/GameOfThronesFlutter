import 'package:dartz/dartz.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/operations/categories/category_business.dart';
import 'package:domain/operations/categories/category_failure.dart';
import 'package:domain/operations/categories/get_local_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_test.mocks.dart';

void main() {
  late GetLocalCategories getLocalCategories;
  var categoryRepository = MockCategoryRepository();

  setUp(() {
    getLocalCategories =
        GetLocalCategories(categoryRepository: categoryRepository);
  });

  final expectedResult = [CategoryBusiness(categoryName: 'test', type: 0)];

  test('Get local categories - Success', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> right =
        Right(expectedResult);
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => right);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, right);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get local categories - Category know error', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(GetCategoriesError());
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category repository exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: RepositoryException()));
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category no internet exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: NoInternet()));
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category unauthorized exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: Unauthorized()));
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category server error exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: ServerError()));
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category unknown exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: NoInternet()));
    when(categoryRepository.getLocalCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getLocalCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getLocalCategories());
    verifyNoMoreInteractions(categoryRepository);
  });
}
