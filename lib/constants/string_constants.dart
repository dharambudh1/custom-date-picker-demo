class StringConstants {
  factory StringConstants() {
    return _singleton;
  }

  StringConstants._internal();
  static final StringConstants _singleton = StringConstants._internal();

  // Shared Preference Keys
  String prefsKeyForWithoutPreset = "prefsKeyForWithoutPreset";
  String prefsKeyForWith4Presets = "prefsKeyForWith4Presets";
  String prefsKeyForWith6Presets = "prefsKeyForWith6Presets";

  // Common Date Format String
  String dateFormat = "dd MMM yyyy";
  String dateFormatForDayName = "EEEE";

  // Home Screen Strings
  String strCalendarWidgets = "Calendar widgets";
  String strWithoutPreset = "Without preset";
  String strWith4Presets = "With 4 presets";
  String strWith6Presets = "With 6 presets";
  String strDeveloperName = "Dharam R. Budh";

  // Dialog Decision Buttons Strings
  String strCancel = "Cancel";
  String strSave = "Save";

  // With 4 Presets Strings
  String strNeverEnds = "Never ends";
  String str15DaysLater = "15 days later";
  String str30DaysLater = "30 days later";
  String str60DaysLater = "60 days later";

  // With 6 Presets Strings
  String strYesterday = "Yesterday";
  String strToday = "Today";
  String strTomorrow = "Tomorrow";
  String strThisSaturday = "This Saturday";
  String strThisSunday = "This Sunday";

  String strThisSameDay(String dayName) {
    return "Next $dayName";
  }

  String strAddingDataTo(String date, String type) {
    return "Shared Preference:\n\nAdding: $date To: $type...";
  }

  String strDeletingDataFrom(String date, String type) {
    return "Shared Preference:\n\nDeleting: $date From: $type...";
  }

  String strTapOnPreset(String presetName) {
    return "Tapped on: $presetName";
  }
}
