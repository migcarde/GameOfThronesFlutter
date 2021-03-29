import 'package:data/operations/books/book_response.dart';
import 'package:data/operations/books/book_service.dart';

class BookRemoteDataSource {
  late final BookService bookService;

  BookRemoteDataSource({required this.bookService});

  Future<List<BookResponse>> getBooks(int type) async {
    final response = await bookService.getBooks(type);

    return response.map((json) => BookResponse.fromJson(json)).toList();
  }
}
