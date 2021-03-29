import 'package:dartz/dartz.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/operations/books/book_business.dart';
import 'package:domain/operations/books/book_failure.dart';
import 'package:domain/operations/books/book_repository.dart';

class GetBooks extends BaseUseCase<BookFailure, List<BookBusiness>, int> {
  late final BookRepository bookRepository;

  GetBooks({required this.bookRepository});

  @override
  Future<Either<BookFailure, List<BookBusiness>>> call(int params) =>
      bookRepository.getBooks(params);
}
