import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/// description:
/// @package: ui
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
mixin UIKits {
  BuildContext mContext;

  void setContext(BuildContext context) {
    this.mContext = context;
  }

  TextStyle get headline1 => mContext.textTheme.headline1
      .copyWith(fontSize: ScreenUtil().setSp(24), height: pxHeight(1.26));

  TextStyle get headline2 => mContext.textTheme.headline2
      .copyWith(fontSize: ScreenUtil().setSp(18), height: pxHeight(1.54));

  TextStyle get headline3 => mContext.textTheme.headline3.copyWith(
      fontSize: ScreenUtil().setSp(16), height: ScreenUtil().setHeight(1.54));

  TextStyle get headline4 => mContext.textTheme.headline4
      .copyWith(fontSize: ScreenUtil().setSp(15), height: pxHeight(1.26));

  TextStyle get headline5 => mContext.textTheme.headline5
      .copyWith(fontSize: ScreenUtil().setSp(14), height: pxHeight(1.26));

  TextStyle get headline6 => mContext.textTheme.headline6
      .copyWith(fontSize: ScreenUtil().setSp(12), height: pxHeight(2));

  TextStyle get subtitle1 => mContext.textTheme.subtitle1
      .copyWith(fontSize: ScreenUtil().setSp(11), height: pxHeight(1.26));

  TextStyle get subtitle2 => mContext.textTheme.subtitle2
      .copyWith(fontSize: ScreenUtil().setSp(10), height: pxHeight(1.26));

  num pxHeight(num val) => ScreenUtil().setHeight(val);

  num pxWidth(num val) => ScreenUtil().setWidth(val);

  num fontSize(num val) => ScreenUtil().setSp(val);

  Widget height(double val) => SizedBox(height: ScreenUtil().setHeight(val));

  Widget width(double val) => SizedBox(width: ScreenUtil().setWidth(val));
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  Size get size => MediaQuery.of(this).size;
}
