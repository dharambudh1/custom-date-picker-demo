import "package:custom_date_picker_demo/constants/color_constants.dart";
import "package:custom_date_picker_demo/constants/string_constants.dart";
import "package:custom_date_picker_demo/utils/common_snack_bar.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    required this.buttonTextString,
    required this.buttonOnPressed,
    required this.isSelected,
    required this.isForHomeScreen,
    required this.isForDialogPreset,
    required this.isForDialogSaveOrCancel,
    super.key,
  });

  final String buttonTextString;
  final void Function() buttonOnPressed;
  final bool isSelected;
  final bool isForHomeScreen;
  final bool isForDialogPreset;
  final bool isForDialogSaveOrCancel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isForHomeScreen
          ? MediaQuery.of(context).size.height * 0.060
          : isForDialogPreset
              ? MediaQuery.of(context).size.height * 0.050
              : isForDialogSaveOrCancel
                  ? MediaQuery.of(context).size.height * 0.060
                  : 0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isSelected
                ? ColorConstants().colorPrimary
                : ColorConstants().colorSecondary,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          if (isForDialogPreset) {
            CommonSnackBar().showSnackBar(
              StringConstants().strTapOnPreset(buttonTextString),
            );
          }
          buttonOnPressed();
        },
        child: Text(
          buttonTextString,
          style: GoogleFonts.roboto(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: isSelected
                ? ColorConstants().colorPureWhite
                : ColorConstants().colorPrimary,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
