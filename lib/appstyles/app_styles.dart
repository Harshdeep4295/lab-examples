import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';

class AppStyles {
  static double width(num width) {
    return ScreenUtil().setWidth(width);
  }

  static num height(num height) {
    return ScreenUtil().setHeight(height);
  }

  static num fontSize(num fontSize, {bool allowFontScalingSelf}) {
    return ScreenUtil()
        .setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
  }

  static TextStyle textStyle(Color color, double fontSize,
      {FontWeight fontWeight,
      FontStyle fontStyle,
      String fontFamily,
      int letterSpacing,
      double heightInline,
      TextDecoration decoration}) {
    return TextStyle(
        color: color == null ? AppColors.black : color,
        fontSize: fontSize,
        fontWeight: fontWeight == null ? FontWeight.w500 : fontWeight,
        fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
        height: heightInline == null ? 1 : heightInline,
        letterSpacing: letterSpacing !=null?letterSpacing:1,
        fontFamily: fontFamily != null ? fontFamily : 'Source Sans Pro',
        decoration: decoration != null ? decoration : TextDecoration.none);
  }

  static Text textwidget(String text,
      {Color color,
      double fontSize,
      FontWeight fontWeight,
      TextAlign textAlign,
      FontStyle fontStyle,
      int letterSpacing,
      String fontFamily,
      double heightInline}) {
    return Text(
      text,
      style: textStyle(
          color,
          fontSize == null
              ? AppStyles.fontSize(22)
              : AppStyles.fontSize(fontSize),
          fontWeight: fontWeight == null ? FontWeight.w600 : fontWeight,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          heightInline: heightInline),
      textAlign: textAlign != null ? textAlign : TextAlign.start,
    );
  }

  static Widget divider(Color color,
      [double width,
      double height,
      bool isRadius = false,
      double paddingVertical]) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: paddingVertical != null
                ? paddingVertical
                : AppStyles.height(10)),
        width: width == null ? double.maxFinite : width,
        height: height != null ? height : 1,
        decoration: new BoxDecoration(
          borderRadius:
              isRadius ? BorderRadius.circular(15) : BorderRadius.circular(0),
          color: color,
        ));
  }

  static MaterialButton button(String buttonText,
      {Color bgColor,
      double radius,
      Color textColor,
      double fontSize,
      FontWeight fontWeight,
      Function onClick,
      Color splashColor,
      Color hoverColor}) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      color: bgColor == null ? AppColors.paradisePink : bgColor,
      splashColor: splashColor != null
          ? splashColor
          : (textColor != null
              ? textColor.withOpacity(0.12)
              : AppColors.paradisePink.withOpacity(0.12)),
      highlightColor: hoverColor != null
          ? hoverColor
          : (textColor != null
              ? textColor.withOpacity(0.4)
              : AppColors.paradisePink.withOpacity(0.4)),
      onPressed: () {
        if (onClick != null) onClick();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        radius == null ? 40 : radius,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
        child: Text(
          buttonText,
          maxLines: 1,
          softWrap: false,
          style: textStyle(
            textColor,
            fontSize == null
                ? AppStyles.fontSize(16)
                : AppStyles.fontSize(fontSize),
            fontWeight: fontWeight == null ? FontWeight.w600 : fontWeight,
          ),
        ),
      ),
    );
  }
}
