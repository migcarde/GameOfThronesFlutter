import 'package:data/repository_failure.dart';
import 'package:domain/operations/chars/char_business.dart';
import 'package:domain/operations/chars/char_failure.dart';
import 'package:domain/operations/chars/get_chars.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/injection_container.dart';
import 'package:game_of_thrones/widgets/chars/char_view_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getChars = locator<GetChars>();

final charsFutureProvider =
    FutureProvider.autoDispose.family<BaseListState, int>((ref, type) async {
  final call = await getChars.call(type);

  return call.fold((l) => _handleCharsError(l), (r) => _handleCharsSuccess(r));
});

Future<BaseListState> _handleCharsSuccess(List<CharBusiness> chars) async {
  if (chars.isEmpty) {
    return Empty();
  } else {
    return Result(
        result: chars
            .map((business) => CharViewEntity.fromBusiness(business))
            .toList());
  }
}

Error _handleCharsError(CharFailure failure) {
  if (failure is CharRepositoryFailure) {
    return _handleRepositoryFailure(failure);
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}

Error _handleRepositoryFailure(CharRepositoryFailure charRepositoryFailure) {
  if (charRepositoryFailure.failure is NoInternet) {
    return Error(message: 'No internet');
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}
