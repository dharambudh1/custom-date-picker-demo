import "package:custom_date_picker_demo/common_widgets/common_button_widget.dart";
import "package:custom_date_picker_demo/constants/color_constants.dart";
import "package:custom_date_picker_demo/constants/string_constants.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

class CommonDialogBottomRowWidget extends StatelessWidget {
  const CommonDialogBottomRowWidget({
    required this.dateTime,
    super.key,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.calendar_month,
          color: ColorConstants().colorPrimary,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            DateFormat(StringConstants().dateFormat).format(dateTime),
            style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: ColorConstants().colorFontText,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CommonButtonWidget(
            isSelected: false,
            buttonTextString: StringConstants().strCancel,
            buttonOnPressed: Get.back,
            isForHomeScreen: false,
            isForDialogPreset: false,
            isForDialogSaveOrCancel: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CommonButtonWidget(
            isSelected: true,
            buttonTextString: StringConstants().strSave,
            buttonOnPressed: () {
              Get.back(
                result: dateTime,
              );
            },
            isForHomeScreen: false,
            isForDialogPreset: false,
            isForDialogSaveOrCancel: true,
          ),
        ),
      ],
    );
  }
}
