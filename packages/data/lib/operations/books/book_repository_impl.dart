import 'package:data/network_manager.dart';
import 'package:data/operations/books/book_remote_data_source.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/books/book_business.dart';
import 'package:domain/operations/books/book_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/operations/books/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  late final BookRemoteDataSource bookRemoteDataSource;
  late final NetworkManager networkManager;

  BookRepositoryImpl(
      {required this.bookRemoteDataSource, required this.networkManager});

  @override
  Future<Either<BookFailure, List<BookBusiness>>> getBooks(int type) async {
    try {
      if (await networkManager.hasInternetConnection) {
        final books = await bookRemoteDataSource.getBooks(type);

        final result = books
            .map((response) => BookBusiness.fromResponse(response))
            .toList();

        return Right(result);
      } else {
        throw NoInternet();
      }
    } on RepositoryFailure catch (failure) {
      return Left(BookRepositoryFailure(failure: failure));
    } on GetBookError {
      return Left(GetBookError());
    }
  }
}
