import "dart:ui";

class ColorConstants {
  factory ColorConstants() {
    return _singleton;
  }

  ColorConstants._internal();
  static final ColorConstants _singleton = ColorConstants._internal();

  Color colorPrimary = const Color(0xff1DA1F2);
  Color colorSecondary = const Color(0xffEDF8FF);
  Color colorPureBlack = const Color(0xff000000);
  Color colorPureWhite = const Color(0xffffffff);
  Color colorFontText = const Color(0xff323238);
  Color colorCalendarArrow = const Color(0xff949C9E);
}
