import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/books/book_item.dart';
import 'package:game_of_thrones/widgets/books/book_list_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookListScreen extends ConsumerWidget {
  final int type;

  const BookListScreen({required this.type});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final books = watch(booksFutureProvider(type));

    return Scaffold(
      body: SafeArea(
        child: books.when(
          data: (data) => _manageState(data),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (_, __) =>
              Text('Ha ocurrido un error, por favor, inténtelo más tarde'),
        ),
      ),
    );
  }

  Widget _manageState(BaseListState state) {
    if (state is Result) {
      return ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) => BookItem(book: state.result[index]));
    } else if (state is Empty) {
      return Center(
        child: Text(
          'La lista esta vacía',
          style: TextStyles.boldText(),
        ),
      );
    } else {
      final error = state as Error;

      return Center(
        child: Text(error.message),
      );
    }
  }
}
