import "package:custom_date_picker_demo/common_widgets/common_button_widget.dart";
import "package:custom_date_picker_demo/common_widgets/common_calendar_widget.dart";
import "package:custom_date_picker_demo/common_widgets/common_dialog_bottom_row_widget.dart";
import "package:custom_date_picker_demo/constants/string_constants.dart";
import "package:custom_date_picker_demo/controllers/calendar_with_4_presets_controller.dart";
import "package:flutter/material.dart";
import "package:flutter_calendar_carousel/classes/event.dart";
import "package:get/get.dart";

class CalendarWith4PresetsDialog extends StatefulWidget {
  const CalendarWith4PresetsDialog({
    required this.savedDateTime,
    super.key,
  });

  final DateTime? savedDateTime;

  @override
  State<CalendarWith4PresetsDialog> createState() =>
      _CalendarWith4PresetsDialogState();
}

class _CalendarWith4PresetsDialogState
    extends State<CalendarWith4PresetsDialog> {
  final CalendarWith4PresetsController _controller = Get.put(
    CalendarWith4PresetsController(),
  );

  @override
  void initState() {
    super.initState();
    if (widget.savedDateTime != null) {
      _controller.updateDateTime(
        widget.savedDateTime!,
        <Event>[],
      );
    }
    _controller.autoSelectPresetIfPossible();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          contentPadding: const EdgeInsets.all(16),
          insetPadding: const EdgeInsets.all(16),
          content: with4PresetsWidget(),
        ),
      ),
    );
  }

  Widget with4PresetsWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.isNeverEndsSelected.value,
                      buttonTextString: StringConstants().strNeverEnds,
                      buttonOnPressed: () {
                        _controller
                          ..selectNeverEndsAndClearRest()
                          ..updateDateTime(
                            _controller.findNeverEnds(),
                            <Event>[],
                          );
                      },
                      isForHomeScreen: false,
                      isForDialogPreset: true,
                      isForDialogSaveOrCancel: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.is15DaysLaterSelected.value,
                      buttonTextString: StringConstants().str15DaysLater,
                      buttonOnPressed: () {
                        _controller
                          ..select15DaysLaterAndClearRest()
                          ..updateDateTime(
                            _controller.find15DaysLater(),
                            <Event>[],
                          );
                      },
                      isForHomeScreen: false,
                      isForDialogPreset: true,
                      isForDialogSaveOrCancel: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.is30DaysLaterSelected.value,
                      buttonTextString: StringConstants().str30DaysLater,
                      buttonOnPressed: () {
                        _controller
                          ..select30DaysLaterAndClearRest()
                          ..updateDateTime(
                            _controller.find30DaysLater(),
                            <Event>[],
                          );
                      },
                      isForHomeScreen: false,
                      isForDialogPreset: true,
                      isForDialogSaveOrCancel: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.is60DaysLaterSelected.value,
                      buttonTextString: StringConstants().str60DaysLater,
                      buttonOnPressed: () {
                        _controller
                          ..select60DaysLaterAndClearRest()
                          ..updateDateTime(
                            _controller.find60DaysLater(),
                            <Event>[],
                          );
                      },
                      isForHomeScreen: false,
                      isForDialogPreset: true,
                      isForDialogSaveOrCancel: false,
                    ),
                  ),
                ],
              ),
              CommonCalendarWidget(
                dateTime: _controller.dateTime.value,
                onDayPressed: (DateTime updateDateTime, List<Event> eventList) {
                  return _controller
                    ..updateDateTime(
                      updateDateTime,
                      eventList,
                    )
                    ..autoSelectPresetIfPossible();
                },
              ),
              CommonDialogBottomRowWidget(
                dateTime: _controller.dateTime.value,
              ),
            ],
          );
        },
      ),
    );
  }
}
