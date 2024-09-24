import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';

class ExitDialogWidget {
  static Future<dynamic> showPopUp() async {
    return Get.defaultDialog(
      backgroundColor: AppColors.appThemeWhite,
      title: "You wanna exit?",
      middleText: "",
      confirm: ElevatedButton(
        style: const ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.appThemeWhite),
          backgroundColor: WidgetStatePropertyAll(AppColors.appThemeRed),
        ),
        onPressed: () {
          SystemNavigator.pop();
        },
        child: const Text("Yes"),
      ),
      cancel: ElevatedButton(
        style: const ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.appThemeWhite),
          backgroundColor: WidgetStatePropertyAll(AppColors.appThemeGreen),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text("NO"),
      ),
    );
  }
}
