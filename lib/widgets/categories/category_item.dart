import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/common/box_decoratos.dart';
import 'package:game_of_thrones/common/custom_colors.dart';
import 'package:game_of_thrones/common/dimens.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/categories/category_view_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryViewEntity category;
  final Function(int) onClick;
  const CategoryItem({Key? key, required this.category, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(category.type),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: tinyDimen, bottom: tinyDimen),
        padding: EdgeInsets.symmetric(
            horizontal: mediumBigDimen, vertical: mediumDimen),
        decoration: BoxDecorators.cardDecoration(Color(blueBackground)),
        child: Text(
          category.categoryName,
          style: TextStyles.boldText(),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
