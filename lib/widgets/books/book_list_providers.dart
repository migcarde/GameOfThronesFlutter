import 'package:data/repository_failure.dart';
import 'package:domain/operations/books/book_business.dart';
import 'package:domain/operations/books/book_failure.dart';
import 'package:domain/operations/books/get_books.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/injection_container.dart';
import 'package:game_of_thrones/widgets/books/book_view_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _getBooks = locator<GetBooks>();

final booksFutureProvider =
    FutureProvider.autoDispose.family<BaseListState, int>((ref, type) async {
  final call = await _getBooks.call(type);

  return call.fold((l) => _handleBooksError(l), (r) => _handleBooksSuccess(r));
});

Future<BaseListState> _handleBooksSuccess(List<BookBusiness> books) async {
  final booksViewEntity =
      books.map((business) => BookViewEntity.fromBusiness(business)).toList();

  return Result<BookViewEntity>(result: booksViewEntity);
}

Error _handleBooksError(BookFailure failure) {
  if (failure is BookRepositoryFailure) {
    return _handleRepositoryFailure(failure);
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}

Error _handleRepositoryFailure(BookRepositoryFailure bookRepositoryFailure) {
  if (bookRepositoryFailure.failure is NoInternet) {
    return Error(message: 'No internet');
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}
