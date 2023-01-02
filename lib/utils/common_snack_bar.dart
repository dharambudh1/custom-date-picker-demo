import "package:flutter/material.dart";
import "package:get/get.dart";

class CommonSnackBar {
  factory CommonSnackBar() {
    return _singleton;
  }

  CommonSnackBar._internal();
  static final CommonSnackBar _singleton = CommonSnackBar._internal();

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String text,
  ) {
    final SnackBar snackBar = SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
    );
    return ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
