import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/common/box_decoratos.dart';
import 'package:game_of_thrones/common/custom_colors.dart';
import 'package:game_of_thrones/common/dimens.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/books/book_view_entity.dart';

class BookItem extends StatelessWidget {
  final BookViewEntity book;

  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(horizontal: mediumDimen, vertical: bigTinyDimen),
      padding: EdgeInsets.all(mediumDimen),
      decoration: BoxDecorators.cardDecoration(Color(blueBackground)),
      child: Column(
        children: [
          Text(
            book.name,
            style: TextStyles.boldText(),
          ),
          Text(
            book.isbn,
            style: TextStyles.grayText(),
          ),
          ...book.authors.map((author) => Text(author)),
          Text(
            book.numberOfPages.toString(),
            style: TextStyles.grayText(),
          ),
          Text(book.publisher),
          Text(book.country),
          Text(book.mediaType),
          Text(book.released)
        ],
      ),
    );
  }
}
