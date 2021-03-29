import 'package:dartz/dartz.dart';
import 'package:domain/operations/books/book_business.dart';
import 'package:domain/operations/books/book_failure.dart';

abstract class BookRepository {
  Future<Either<BookFailure, List<BookBusiness>>> getBooks(int type);
}
