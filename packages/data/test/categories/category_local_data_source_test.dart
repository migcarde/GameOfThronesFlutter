import 'dart:io';

import 'package:data/operations/categories/category_hive_model.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_local_data_source_test.mocks.dart';

@GenerateMocks([Box, HiveInterface])
void main() {
  var mockBox = MockBox();
  var mockHive = MockHiveInterface();
  late final CategoryLocalDataSource localDataSource;

  const BOX = 'categoriesBox';
  final categories = [CategoryHiveModel(type: 0, categoryName: 'example')];

  final categoriesMap = Map.fromIterable(categories);

  setUp(() {
    final path = Directory.current.path;
    Hive.init(path);
    localDataSource = CategoryLocalDataSource(hive: mockHive);
  });

  test("Get categories - Success", () async {
    // Given
    when(mockHive.openBox(BOX)).thenAnswer((realInvocation) async => mockBox);
    when(mockBox.toMap()).thenAnswer((realInvocation) => categoriesMap);

    // When
    final result = await localDataSource.getCategories();

    // Then
    expect(result, categories);
  });
}
