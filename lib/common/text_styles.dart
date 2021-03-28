import 'package:flutter/material.dart';
import 'package:game_of_thrones/common/custom_colors.dart';

const cardTitleSize = 18.0;
const lotteryNumberSize = 15.0;
const tabBarTextSize = 25.0;

class TextStyles {
  static TextStyle whiteText([double? size]) {
    return TextStyle(color: Colors.white, fontSize: size);
  }

  static TextStyle blackText([double? size]) {
    return TextStyle(color: Colors.black, fontSize: size);
  }

  static TextStyle grayText([double? size]) {
    return TextStyle(color: Color(lightGrey), fontSize: size);
  }

  static TextStyle boldText([double? size]) {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: size);
  }
}
