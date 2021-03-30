import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/common/box_decoratos.dart';
import 'package:game_of_thrones/common/custom_colors.dart';
import 'package:game_of_thrones/common/dimens.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/houses/house_view_entity.dart';

class HouseItem extends StatelessWidget {
  final HouseViewEntity house;
  const HouseItem({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(horizontal: mediumDimen, vertical: bigTinyDimen),
      padding: EdgeInsets.all(mediumDimen),
      decoration: BoxDecorators.cardDecoration(Color(blueBackground)),
      child: Row(
        children: [
          if (house.picture != null)
            Image.network(
              house.picture!,
              width: housePictureDimen,
              height: housePictureDimen,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  house.name,
                  style: TextStyles.boldText(),
                ),
                Text(
                  house.region,
                  style: TextStyles.grayText(),
                ),
                if (house.title != null) Text(house.title!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
