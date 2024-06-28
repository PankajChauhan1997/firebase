import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controller/generate_qr_code_controller.dart';

class GenerateQrPage extends StatelessWidget {
  final GenerateQrController controller = Get.put(GenerateQrController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR code"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => controller.qrData.value.isNotEmpty
                      ? QrImageView(
                          data: controller.qrData.value,
                          version: QrVersions.auto,
                          size: 200.0,
                        )
                      : Container() // Return an empty container if no QR data
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Enter your data', // Updated label text
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.generateQrCode();
                },
                child: Text('Generate QR code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
