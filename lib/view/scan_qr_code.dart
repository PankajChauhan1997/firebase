import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controller/scan_qr_code_controller.dart';

class scan_qr extends StatelessWidget {
  scan_qr_controller controller = Get.put(scan_qr_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "${controller.qrResult}",
                  style: TextStyle(fontSize: 18),
                )),
            ElevatedButton(
                onPressed: () {
                  controller.scanqr();
                },
                child: Text("Scan Code "))
          ],
        ),
      ),
    );
  }
}
