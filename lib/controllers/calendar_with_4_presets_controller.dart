import "package:flutter_calendar_carousel/classes/event.dart";
import "package:get/get.dart";

enum ButtonType { withoutPreset, with4Presets, with6Presets }

class CalendarWith4PresetsController extends GetxController {
  Rx<DateTime> dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;
  RxBool isNeverEndsSelected = false.obs;
  RxBool is15DaysLaterSelected = false.obs;
  RxBool is30DaysLaterSelected = false.obs;
  RxBool is60DaysLaterSelected = false.obs;

  void updateDateTime(DateTime updateDateTime, List<Event> eventList) {
    dateTime(updateDateTime);
    return;
  }

  void selectNoneAndClearRest() {
    isNeverEndsSelected(false);
    is15DaysLaterSelected(false);
    is30DaysLaterSelected(false);
    is60DaysLaterSelected(false);
    return;
  }

  void selectNeverEndsAndClearRest() {
    isNeverEndsSelected(true);
    is15DaysLaterSelected(false);
    is30DaysLaterSelected(false);
    is60DaysLaterSelected(false);
    return;
  }

  void select15DaysLaterAndClearRest() {
    isNeverEndsSelected(false);
    is15DaysLaterSelected(true);
    is30DaysLaterSelected(false);
    is60DaysLaterSelected(false);
    return;
  }

  void select30DaysLaterAndClearRest() {
    isNeverEndsSelected(false);
    is15DaysLaterSelected(false);
    is30DaysLaterSelected(true);
    is60DaysLaterSelected(false);
    return;
  }

  void select60DaysLaterAndClearRest() {
    isNeverEndsSelected(false);
    is15DaysLaterSelected(false);
    is30DaysLaterSelected(false);
    is60DaysLaterSelected(true);
    return;
  }

  DateTime findNeverEnds() {
    return DateTime(
      DateTime.now().year + 1000,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  DateTime find15DaysLater() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 15,
    );
  }

  DateTime find30DaysLater() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 30,
    );
  }

  DateTime find60DaysLater() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 60,
    );
  }

  void autoSelectPresetIfPossible() {
    if (dateTime.value == findNeverEnds()) {
      selectNeverEndsAndClearRest();
    } else if (dateTime.value == find15DaysLater()) {
      select15DaysLaterAndClearRest();
    } else if (dateTime.value == find30DaysLater()) {
      select30DaysLaterAndClearRest();
    } else if (dateTime.value == find60DaysLater()) {
      select60DaysLaterAndClearRest();
    } else {
      selectNoneAndClearRest();
    }
    return;
  }
}
