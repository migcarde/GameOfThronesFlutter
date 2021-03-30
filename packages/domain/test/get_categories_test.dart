import 'package:dartz/dartz.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/operations/categories/category_business.dart';
import 'package:domain/operations/categories/category_failure.dart';
import 'package:domain/operations/categories/category_repository.dart';
import 'package:domain/operations/categories/get_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  late GetCategories getCategories;
  var categoryRepository = MockCategoryRepository();

  setUp(() {
    getCategories = GetCategories(categoryRepository: categoryRepository);
  });

  final expectedResult = [CategoryBusiness(categoryName: 'test', type: 0)];

  test('Get categories - Success', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> right =
        Right(expectedResult);
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => right);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, right);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category know error', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(GetCategoriesError());
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category repository exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: RepositoryException()));
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category no internet exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: NoInternet()));
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category unauthorized exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: Unauthorized()));
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category server error exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: ServerError()));
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });

  test('Get categories - Category unknown exception', () async {
    // Given
    final Either<CategoryFailure, List<CategoryBusiness>> left =
        Left(CategoryRepositoryFailure(failure: NoInternet()));
    when(categoryRepository.getCategories())
        .thenAnswer((realInvocation) async => left);

    // When
    final result = await getCategories.call(NoParams());

    expect(result, left);

    verify(categoryRepository.getCategories());
    verifyNoMoreInteractions(categoryRepository);
  });
}
