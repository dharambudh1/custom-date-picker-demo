import "package:custom_date_picker_demo/common_widgets/common_button_widget.dart";
import "package:custom_date_picker_demo/common_widgets/common_calendar_widget.dart";
import "package:custom_date_picker_demo/common_widgets/common_dialog_bottom_row_widget.dart";
import "package:custom_date_picker_demo/constants/string_constants.dart";
import "package:custom_date_picker_demo/controllers/calendar_with_6_presets_controller.dart";
import "package:flutter/material.dart";
import "package:flutter_calendar_carousel/classes/event.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class CalendarWith6PresetsDialog extends StatefulWidget {
  const CalendarWith6PresetsDialog({
    required this.savedDateTime,
    super.key,
  });

  final DateTime? savedDateTime;

  @override
  State<CalendarWith6PresetsDialog> createState() =>
      _CalendarWith6PresetsDialogState();
}

class _CalendarWith6PresetsDialogState
    extends State<CalendarWith6PresetsDialog> {
  final CalendarWith6PresetsController _controller = Get.put(
    CalendarWith6PresetsController(),
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
          content: with6PresetsWidget(),
        ),
      ),
    );
  }

  Widget with6PresetsWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.isYesterdaySelected.value,
                      buttonTextString: StringConstants().strYesterday,
                      buttonOnPressed: () {
                        _controller
                          ..selectYesterdayAndClearRest()
                          ..updateDateTime(
                            _controller.findYesterday(),
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
                      isSelected: _controller.isTodaySelected.value,
                      buttonTextString: StringConstants().strToday,
                      buttonOnPressed: () {
                        _controller
                          ..selectTodayAndClearRest()
                          ..updateDateTime(
                            _controller.findToday(),
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
                children: <Widget>[
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.isTomorrowSelected.value,
                      buttonTextString: StringConstants().strTomorrow,
                      buttonOnPressed: () {
                        _controller
                          ..selectTomorrowAndClearRest()
                          ..updateDateTime(
                            _controller.findTomorrow(),
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
                      isSelected: _controller.isThisSaturdaySelected.value,
                      buttonTextString: StringConstants().strThisSaturday,
                      buttonOnPressed: () {
                        _controller
                          ..selectThisSaturdayAndClearRest()
                          ..updateDateTime(
                            _controller.findThisSaturday(),
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
                children: <Widget>[
                  Expanded(
                    child: CommonButtonWidget(
                      isSelected: _controller.isThisSundaySelected.value,
                      buttonTextString: StringConstants().strThisSunday,
                      buttonOnPressed: () {
                        _controller
                          ..selectThisSundayAndClearRest()
                          ..updateDateTime(
                            _controller.findThisSunday(),
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
                      isSelected: _controller.isNextSameDaySelected.value,
                      buttonTextString: StringConstants().strThisSameDay(
                        DateFormat(
                          StringConstants().dateFormatForDayName,
                        ).format(
                          DateTime.now(),
                        ),
                      ),
                      buttonOnPressed: () {
                        _controller
                          ..selectNextSameDayAndClearRest()
                          ..updateDateTime(
                            _controller.findNextSameDay(),
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
