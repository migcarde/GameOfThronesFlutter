import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/common/radius.dart';

class BoxDecorators {
  static BoxDecoration cardDecoration([Color? color]) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(boxBorder), color: color);
  }
}
