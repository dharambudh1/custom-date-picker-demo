import "package:custom_date_picker_demo/constants/string_constants.dart";
import "package:custom_date_picker_demo/utils/common_snack_bar.dart";
import "package:custom_date_picker_demo/utils/shared_pref_manager.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

enum ButtonType { withoutPreset, with4Presets, with6Presets }

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initValueFromSharedPrefIfAvailable();
  }

  RxBool withoutPresetVisibility = false.obs;
  RxBool with4PresetsVisibility = false.obs;
  RxBool with6PresetsVisibility = false.obs;
  RxString withoutPresetString = "".obs;
  RxString with4PresetsString = "".obs;
  RxString with6PresetsString = "".obs;

  void buttonOnPressedHandler(ButtonType buttonType, String result) {
    switch (buttonType) {
      case ButtonType.withoutPreset:
        withoutPresetVisibility(true);
        withoutPresetString(result);
        break;
      case ButtonType.with4Presets:
        with4PresetsVisibility(true);
        with4PresetsString(result);
        break;
      case ButtonType.with6Presets:
        with6PresetsVisibility(true);
        with6PresetsString(result);
        break;
    }
    return;
  }

  void chipOnPressedHandler(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.withoutPreset:
        withoutPresetVisibility(false);
        withoutPresetString("");
        break;
      case ButtonType.with4Presets:
        with4PresetsVisibility(false);
        with4PresetsString("");
        break;
      case ButtonType.with6Presets:
        with6PresetsVisibility(false);
        with6PresetsString("");
        break;
    }
    return;
  }

  DateTime? checkValueForWithoutPreset() {
    return withoutPresetString.value == ""
        ? null
        : DateFormat(StringConstants().dateFormat).parse(
            withoutPresetString.value,
          );
  }

  DateTime? checkValueForWith4Presets() {
    return with4PresetsString.value == ""
        ? null
        : DateFormat(StringConstants().dateFormat).parse(
            with4PresetsString.value,
          );
  }

  DateTime? checkValueForWith6Presets() {
    return with6PresetsString.value == ""
        ? null
        : DateFormat(StringConstants().dateFormat).parse(
            with6PresetsString.value,
          );
  }

  Future<void> showAddOrDelete({
    required ButtonType buttonType,
    required bool isForAdding,
  }) async {
    String value = "";
    String type = "";
    String key = "";
    switch (buttonType) {
      case ButtonType.withoutPreset:
        value = withoutPresetString.value;
        type = StringConstants().strWithoutPreset;
        key = StringConstants().prefsKeyForWithoutPreset;
        break;
      case ButtonType.with4Presets:
        value = with4PresetsString.value;
        type = StringConstants().strWith4Presets;
        key = StringConstants().prefsKeyForWith4Presets;
        break;
      case ButtonType.with6Presets:
        value = with6PresetsString.value;
        type = StringConstants().strWith6Presets;
        key = StringConstants().prefsKeyForWith6Presets;
        break;
    }
    CommonSnackBar().showSnackBar(
      isForAdding
          ? StringConstants().strAddingDataTo(value, type)
          : StringConstants().strDeletingDataFrom(value, type),
    );
    isForAdding
        ? await SharedPrefManager().setData(key, value)
        : await SharedPrefManager().deleteData(key);
    return;
  }

  void initValueFromSharedPrefIfAvailable() {
    final String initValueForWithoutPreset = SharedPrefManager().getData(
      StringConstants().prefsKeyForWithoutPreset,
    );
    final String initValueForWith4Presets = SharedPrefManager().getData(
      StringConstants().prefsKeyForWith4Presets,
    );
    final String initValueForWith6Presets = SharedPrefManager().getData(
      StringConstants().prefsKeyForWith6Presets,
    );
    if (initValueForWithoutPreset != "") {
      withoutPresetVisibility(true);
      withoutPresetString(initValueForWithoutPreset);
    }
    if (initValueForWith4Presets != "") {
      with4PresetsVisibility(true);
      with4PresetsString(initValueForWith4Presets);
    }
    if (initValueForWith6Presets != "") {
      with6PresetsVisibility(true);
      with6PresetsString(initValueForWith6Presets);
    }
    return;
  }
}
