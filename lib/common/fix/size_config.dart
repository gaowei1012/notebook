import 'package:flutter/widgets.dart';
/// UI适配
class SizeConfig {

  static MediaQueryData _mediaQueryData;
  static double screentWidth;
  static double screenyHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screentWidth = _mediaQueryData.size.width;
    screenyHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screentWidth / 100;
    blockSizeVertical = screenyHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screentWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenyHeight - _safeAreaVertical) / 100;
  }
}