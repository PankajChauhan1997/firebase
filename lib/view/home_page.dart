import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_generator/controller/home_controller.dart';
import 'package:qr_code_generator/view/scan_qr_code.dart';
import 'generate_qr_code.dart';

class home_page extends StatelessWidget {
  home_controller controller = Get.put(home_controller());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("QR code"),
          actions: [
            Switch(
                value: controller.isDarkTheme.value,
                onChanged: (value) {
                  controller.toggleTheme();
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => GenerateQrPage());
                  },
                  child: Text("Generate QR code")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => scan_qr());
                  },
                  child: Text("Scan QR code"))
            ],
          ),
        ),
      ),
    );
  }
}
