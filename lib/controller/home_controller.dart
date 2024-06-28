import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home_controller extends GetxController {
  RxBool isDarkTheme = false.obs;
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
  }
}
