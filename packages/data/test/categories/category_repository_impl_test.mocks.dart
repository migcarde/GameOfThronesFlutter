// Mocks generated by Mockito 5.0.3 from annotations
// in data/test/categories/category_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:connectivity/connectivity.dart' as _i4;
import 'package:data/network_manager.dart' as _i10;
import 'package:data/operations/categories/category_hive_model.dart' as _i9;
import 'package:data/operations/categories/category_local_data_source.dart'
    as _i8;
import 'package:data/operations/categories/category_remote_data_source.dart'
    as _i5;
import 'package:data/operations/categories/category_response.dart' as _i7;
import 'package:data/operations/categories/category_service.dart' as _i2;
import 'package:hive/hive.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeCategoryService extends _i1.Fake implements _i2.CategoryService {}

class _FakeHiveInterface extends _i1.Fake implements _i3.HiveInterface {}

class _FakeConnectivity extends _i1.Fake implements _i4.Connectivity {}

/// A class which mocks [CategoryRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryRemoteDataSource extends _i1.Mock
    implements _i5.CategoryRemoteDataSource {
  MockCategoryRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CategoryService get categoryService =>
      (super.noSuchMethod(Invocation.getter(#categoryService),
          returnValue: _FakeCategoryService()) as _i2.CategoryService);
  @override
  set categoryService(_i2.CategoryService? _categoryService) =>
      super.noSuchMethod(Invocation.setter(#categoryService, _categoryService),
          returnValueForMissingStub: null);
  @override
  _i6.Future<List<_i7.CategoryResponse>> getCategories() =>
      (super.noSuchMethod(Invocation.method(#getCategories, []),
              returnValue: Future.value(<_i7.CategoryResponse>[]))
          as _i6.Future<List<_i7.CategoryResponse>>);
}

/// A class which mocks [CategoryLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryLocalDataSource extends _i1.Mock
    implements _i8.CategoryLocalDataSource {
  MockCategoryLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.HiveInterface get hive => (super.noSuchMethod(Invocation.getter(#hive),
      returnValue: _FakeHiveInterface()) as _i3.HiveInterface);
  @override
  set hive(_i3.HiveInterface? _hive) =>
      super.noSuchMethod(Invocation.setter(#hive, _hive),
          returnValueForMissingStub: null);
  @override
  void saveCategories(List<_i7.CategoryResponse>? categories) =>
      super.noSuchMethod(Invocation.method(#saveCategories, [categories]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<List<_i9.CategoryHiveModel>> getCategories() =>
      (super.noSuchMethod(Invocation.method(#getCategories, []),
              returnValue: Future.value(<_i9.CategoryHiveModel>[]))
          as _i6.Future<List<_i9.CategoryHiveModel>>);
}

/// A class which mocks [NetworkManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkManager extends _i1.Mock implements _i10.NetworkManager {
  MockNetworkManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Connectivity get connectivity =>
      (super.noSuchMethod(Invocation.getter(#connectivity),
          returnValue: _FakeConnectivity()) as _i4.Connectivity);
  @override
  set connectivity(_i4.Connectivity? _connectivity) =>
      super.noSuchMethod(Invocation.setter(#connectivity, _connectivity),
          returnValueForMissingStub: null);
  @override
  _i6.Future<bool> get hasInternetConnection =>
      (super.noSuchMethod(Invocation.getter(#hasInternetConnection),
          returnValue: Future.value(false)) as _i6.Future<bool>);
}
