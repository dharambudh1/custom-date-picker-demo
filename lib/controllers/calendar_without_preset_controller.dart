import "package:flutter_calendar_carousel/classes/event.dart";
import "package:get/get.dart";

enum ButtonType { withoutPreset, with4Presets, with6Presets }

class CalendarWithoutPresetController extends GetxController {
  Rx<DateTime> dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  void updateDateTime(DateTime updateDateTime, List<Event> eventList) {
    dateTime(updateDateTime);
    return;
  }
}
