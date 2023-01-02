import "package:custom_date_picker_demo/common_widgets/common_calendar_widget.dart";
import "package:custom_date_picker_demo/common_widgets/common_dialog_bottom_row_widget.dart";
import "package:custom_date_picker_demo/controllers/calendar_without_preset_controller.dart";
import "package:flutter/material.dart";
import "package:flutter_calendar_carousel/classes/event.dart";
import "package:get/get.dart";

class CalendarWithoutPresetDialog extends StatefulWidget {
  const CalendarWithoutPresetDialog({
    required this.savedDateTime,
    super.key,
  });

  final DateTime? savedDateTime;

  @override
  State<CalendarWithoutPresetDialog> createState() =>
      _CalendarWithoutPresetDialogState();
}

class _CalendarWithoutPresetDialogState
    extends State<CalendarWithoutPresetDialog> {
  final CalendarWithoutPresetController _controller = Get.put(
    CalendarWithoutPresetController(),
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
          content: withoutPresetWidget(),
        ),
      ),
    );
  }

  Widget withoutPresetWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CommonCalendarWidget(
                dateTime: _controller.dateTime.value,
                onDayPressed: _controller.updateDateTime,
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
