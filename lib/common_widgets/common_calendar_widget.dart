import "package:custom_date_picker_demo/constants/color_constants.dart";
import "package:flutter/material.dart";
import "package:flutter_calendar_carousel/classes/event.dart";
import "package:flutter_calendar_carousel/flutter_calendar_carousel.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";

class CommonCalendarWidget extends StatefulWidget {
  const CommonCalendarWidget({
    required this.dateTime,
    required this.onDayPressed,
    super.key,
  });

  final DateTime dateTime;
  final Function(DateTime dateTime, List<Event> eventList) onDayPressed;

  @override
  State<CommonCalendarWidget> createState() => _CommonCalendarWidgetState();
}

class _CommonCalendarWidgetState extends State<CommonCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      pageSnapping: true,
      shouldShowTransform: false,
      pageScrollPhysics: const ClampingScrollPhysics(),
      height: MediaQuery.of(context).size.height / 2,
      targetDateTime: widget.dateTime,
      selectedDateTime: widget.dateTime,
      onDayPressed: widget.onDayPressed,
      weekdayTextStyle: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: ColorConstants().colorFontText,
      ),
      weekendTextStyle: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: ColorConstants().colorFontText,
      ),
      todayButtonColor: ColorConstants().colorPureWhite,
      todayTextStyle: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: ColorConstants().colorPrimary,
      ),
      selectedDayButtonColor: ColorConstants().colorPrimary,
      selectedDayTextStyle: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: ColorConstants().colorPureWhite,
      ),
      headerTextStyle: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: ColorConstants().colorFontText,
      ),
      leftButtonIcon: FaIcon(
        FontAwesomeIcons.caretLeft,
        color: ColorConstants().colorCalendarArrow,
      ),
      rightButtonIcon: FaIcon(
        FontAwesomeIcons.caretRight,
        color: ColorConstants().colorCalendarArrow,
      ),
      headerMargin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: MediaQuery.of(context).size.width * 0.08,
      ),
      minSelectedDate: DateTime(
        widget.dateTime.year - 100,
        widget.dateTime.month,
        widget.dateTime.day,
      ),
      maxSelectedDate: DateTime(
        widget.dateTime.year + 1000,
        widget.dateTime.month,
        widget.dateTime.day,
      ),
    );
  }
}
