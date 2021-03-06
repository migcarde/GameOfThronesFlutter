// Mocks generated by Mockito 5.0.3 from annotations
// in data/test/chars/char_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:connectivity/connectivity.dart' as _i3;
import 'package:data/network_manager.dart' as _i7;
import 'package:data/operations/chars/char_remote_data_source.dart' as _i4;
import 'package:data/operations/chars/char_response.dart' as _i6;
import 'package:data/operations/chars/char_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeCharService extends _i1.Fake implements _i2.CharService {}

class _FakeConnectivity extends _i1.Fake implements _i3.Connectivity {}

/// A class which mocks [CharRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharRemoteDataSource extends _i1.Mock
    implements _i4.CharRemoteDataSource {
  MockCharRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CharService get charService =>
      (super.noSuchMethod(Invocation.getter(#charService),
          returnValue: _FakeCharService()) as _i2.CharService);
  @override
  set charService(_i2.CharService? _charService) =>
      super.noSuchMethod(Invocation.setter(#charService, _charService),
          returnValueForMissingStub: null);
  @override
  _i5.Future<List<_i6.CharResponse>> getChars(int? type) =>
      (super.noSuchMethod(Invocation.method(#getChars, [type]),
              returnValue: Future.value(<_i6.CharResponse>[]))
          as _i5.Future<List<_i6.CharResponse>>);
}

/// A class which mocks [NetworkManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkManager extends _i1.Mock implements _i7.NetworkManager {
  MockNetworkManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Connectivity get connectivity =>
      (super.noSuchMethod(Invocation.getter(#connectivity),
          returnValue: _FakeConnectivity()) as _i3.Connectivity);
  @override
  set connectivity(_i3.Connectivity? _connectivity) =>
      super.noSuchMethod(Invocation.setter(#connectivity, _connectivity),
          returnValueForMissingStub: null);
  @override
  _i5.Future<bool> get hasInternetConnection =>
      (super.noSuchMethod(Invocation.getter(#hasInternetConnection),
          returnValue: Future.value(false)) as _i5.Future<bool>);
}
