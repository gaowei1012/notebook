import 'package:flutter/widgets.dart';
/// UI适配
class SizeConfig {

  /// 定义MediaQueryData对象
  static MediaQueryData _mediaQueryData;
  /// 定义默认宽度
  static double screentWidth;
  /// 定义默认高度
  static double screenyHeight;
  /// 定义实际发生改变的高度
  static double blockSizeHorizontal;
  /// 定义实际发生改变的宽度
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  /**
   * @init 设置自动适应
   * BuildContext context
   */
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