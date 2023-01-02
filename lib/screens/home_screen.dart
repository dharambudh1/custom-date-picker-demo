import "package:custom_date_picker_demo/common_dialogs/calendar_with_4_presets_dialog.dart";
import "package:custom_date_picker_demo/common_dialogs/calendar_with_6_presets_dialog.dart";
import "package:custom_date_picker_demo/common_dialogs/calendar_without_preset_dialog.dart";
import "package:custom_date_picker_demo/common_widgets/common_button_widget.dart";
import "package:custom_date_picker_demo/constants/color_constants.dart";
import "package:custom_date_picker_demo/constants/string_constants.dart";
import "package:custom_date_picker_demo/controllers/home_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _controller = Get.put(
    HomeScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () {
              return Column(
                children: <Widget>[
                  const Spacer(flex: 2),
                  Text(
                    StringConstants().strCalendarWidgets,
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: ColorConstants().colorFontText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  commonButtonAndChipWidget(
                    buttonTextString: StringConstants().strWithoutPreset,
                    buttonOnPressed: () async {
                      await commonButtonOnPressed(
                        ButtonType.withoutPreset,
                      );
                    },
                    chipTextString: _controller.withoutPresetString.value,
                    chipOnPressed: () async {
                      await _controller.showAddOrDelete(
                        buttonType: ButtonType.withoutPreset,
                        isForAdding: false,
                      );
                      _controller.chipOnPressedHandler(
                        ButtonType.withoutPreset,
                      );
                    },
                    chipVisibility: _controller.withoutPresetVisibility.value,
                  ),
                  commonButtonAndChipWidget(
                    buttonTextString: StringConstants().strWith4Presets,
                    buttonOnPressed: () async {
                      await commonButtonOnPressed(
                        ButtonType.with4Presets,
                      );
                    },
                    chipTextString: _controller.with4PresetsString.value,
                    chipOnPressed: () async {
                      await _controller.showAddOrDelete(
                        buttonType: ButtonType.with4Presets,
                        isForAdding: false,
                      );
                      _controller.chipOnPressedHandler(
                        ButtonType.with4Presets,
                      );
                    },
                    chipVisibility: _controller.with4PresetsVisibility.value,
                  ),
                  commonButtonAndChipWidget(
                    buttonTextString: StringConstants().strWith6Presets,
                    buttonOnPressed: () async {
                      await commonButtonOnPressed(
                        ButtonType.with6Presets,
                      );
                    },
                    chipTextString: _controller.with6PresetsString.value,
                    chipOnPressed: () async {
                      await _controller.showAddOrDelete(
                        buttonType: ButtonType.with6Presets,
                        isForAdding: false,
                      );
                      _controller.chipOnPressedHandler(
                        ButtonType.with6Presets,
                      );
                    },
                    chipVisibility: _controller.with6PresetsVisibility.value,
                  ),
                  const Spacer(),
                  Text(
                    StringConstants().strDeveloperName,
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ColorConstants().colorPureBlack,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget commonChipWidget({
    required String chipTextString,
    required void Function() chipOnPressed,
    required bool chipVisibility,
  }) {
    return Visibility(
      visible: chipVisibility,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Chip(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(68.0),
        ),
        backgroundColor: ColorConstants().colorSecondary,
        labelPadding: const EdgeInsets.all(4),
        deleteIcon: const Icon(Icons.close),
        deleteIconColor: ColorConstants().colorPrimary,
        onDeleted: chipOnPressed,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.calendar_month,
              color: ColorConstants().colorPrimary,
            ),
            const SizedBox(width: 8),
            Text(
              chipTextString,
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: ColorConstants().colorPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget commonButtonAndChipWidget({
    required String buttonTextString,
    required void Function() buttonOnPressed,
    required String chipTextString,
    required void Function() chipOnPressed,
    required bool chipVisibility,
  }) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: CommonButtonWidget(
                isSelected: true,
                buttonTextString: buttonTextString,
                buttonOnPressed: buttonOnPressed,
                isForHomeScreen: true,
                isForDialogPreset: false,
                isForDialogSaveOrCancel: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        commonChipWidget(
          chipTextString: chipTextString,
          chipOnPressed: chipOnPressed,
          chipVisibility: chipVisibility,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Future<void> commonButtonOnPressed(ButtonType buttonType) async {
    Widget widget = const SizedBox();
    switch (buttonType) {
      case ButtonType.withoutPreset:
        widget = CalendarWithoutPresetDialog(
          savedDateTime: _controller.checkValueForWithoutPreset(),
        );
        break;
      case ButtonType.with4Presets:
        widget = CalendarWith4PresetsDialog(
          savedDateTime: _controller.checkValueForWith4Presets(),
        );
        break;
      case ButtonType.with6Presets:
        widget = CalendarWith6PresetsDialog(
          savedDateTime: _controller.checkValueForWith6Presets(),
        );
        break;
    }
    final DateTime? result = await Get.dialog(widget);
    if (result != null) {
      _controller.buttonOnPressedHandler(
        buttonType,
        DateFormat(StringConstants().dateFormat).format(result),
      );
      await _controller.showAddOrDelete(
        buttonType: buttonType,
        isForAdding: true,
      );
    }
    return Future<void>.value();
  }
}
