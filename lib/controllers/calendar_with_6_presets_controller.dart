import "package:flutter_calendar_carousel/classes/event.dart";
import "package:get/get.dart";

enum ButtonType { withoutPreset, with4Presets, with6Presets }

class CalendarWith6PresetsController extends GetxController {
  Rx<DateTime> dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;
  RxBool isYesterdaySelected = false.obs;
  RxBool isTodaySelected = false.obs;
  RxBool isTomorrowSelected = false.obs;
  RxBool isThisSaturdaySelected = false.obs;
  RxBool isThisSundaySelected = false.obs;
  RxBool isNextSameDaySelected = false.obs;

  void updateDateTime(DateTime updateDateTime, List<Event> eventList) {
    dateTime(updateDateTime);
    return;
  }

  void selectNoneAndClearRest() {
    isYesterdaySelected(false);
    isTodaySelected(false);
    isTomorrowSelected(false);
    isThisSaturdaySelected(false);
    isThisSundaySelected(false);
    isNextSameDaySelected(false);
    return;
  }

  void selectYesterdayAndClearRest() {
    isYesterdaySelected(true);
    isTodaySelected(false);
    isTomorrowSelected(false);
    isThisSaturdaySelected(false);
    isThisSundaySelected(false);
    isNextSameDaySelected(false);
    return;
  }

  void selectTodayAndClearRest() {
    isYesterdaySelected(false);
    isTodaySelected(true);
    isTomorrowSelected(false);
    isThisSaturdaySelected(false);
    isThisSundaySelected(false);
    isNextSameDaySelected(false);
    return;
  }

  void selectTomorrowAndClearRest() {
    isYesterdaySelected(false);
    isTodaySelected(false);
    isTomorrowSelected(true);
    isThisSaturdaySelected(false);
    isThisSundaySelected(false);
    isNextSameDaySelected(false);
    return;
  }

  void selectThisSaturdayAndClearRest() {
    isYesterdaySelected(false);
    isTodaySelected(false);
    isTomorrowSelected(false);
    isThisSaturdaySelected(true);
    isThisSundaySelected(false);
    isNextSameDaySelected(false);
    return;
  }

  void selectThisSundayAndClearRest() {
    isYesterdaySelected(false);
    isTodaySelected(false);
    isTomorrowSelected(false);
    isThisSaturdaySelected(false);
    isThisSundaySelected(true);
    isNextSameDaySelected(false);
    return;
  }

  void selectNextSameDayAndClearRest() {
    isYesterdaySelected(false);
    isTodaySelected(false);
    isTomorrowSelected(false);
    isThisSaturdaySelected(false);
    isThisSundaySelected(false);
    isNextSameDaySelected(true);
    return;
  }

  DateTime findYesterday() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 1,
    );
  }

  DateTime findToday() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  DateTime findTomorrow() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    );
  }

  DateTime findThisSaturday() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(
      Duration(
        days: (6 - DateTime.now().weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  DateTime findThisSunday() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(
      Duration(
        days: (7 - DateTime.now().weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  DateTime findNextSameDay() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(
      const Duration(
        days: DateTime.daysPerWeek,
      ),
    );
  }

  void autoSelectPresetIfPossible() {
    if (dateTime.value == findYesterday()) {
      selectYesterdayAndClearRest();
    } else if (dateTime.value == findToday()) {
      selectTodayAndClearRest();
    } else if (dateTime.value == findTomorrow()) {
      selectTomorrowAndClearRest();
    } else if (dateTime.value == findThisSaturday()) {
      selectThisSaturdayAndClearRest();
    } else if (dateTime.value == findThisSunday()) {
      selectThisSundayAndClearRest();
    } else if (dateTime.value == findNextSameDay()) {
      selectNextSameDayAndClearRest();
    } else {
      selectNoneAndClearRest();
    }
    return;
  }
}
