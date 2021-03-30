import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/common/box_decoratos.dart';
import 'package:game_of_thrones/common/custom_colors.dart';
import 'package:game_of_thrones/common/dimens.dart';
import 'package:game_of_thrones/widgets/chars/char_view_entity.dart';

class CharItem extends StatelessWidget {
  final CharViewEntity char;

  const CharItem({Key? key, required this.char}) : super(key: key);

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
          Text(char.name),
          Text(char.gender),
          if (char.culture != null) Text(char.culture!),
          if (char.born != null) Text(char.born!),
          if (char.died != null) Text(char.died!),
          ...char.titles.map((title) => Text(title)),
          ...char.aliases.map((alias) => Text(alias)),
          if (char.father != null) Text(char.father!),
          if (char.mother != null) Text(char.mother!),
          if (char.spouse != null) Text(char.spouse!),
          ...char.playedBy.map((e) => Text(e))
        ],
      ),
    );
  }
}
