import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(
  String title,
  String message,
) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(10),
    borderColor: Get.theme.scaffoldBackgroundColor,
    backgroundColor: Get.theme.cardColor,
    borderRadius: 16,
    borderWidth: 1,
    titleText: Text(
      title,
      style: TextStyle(
        color: Colors.red,
        fontSize: 20,
      ),
    ),
  );
}
