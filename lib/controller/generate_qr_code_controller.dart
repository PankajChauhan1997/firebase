import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrController extends GetxController {
  TextEditingController urlController = TextEditingController();
  RxString qrData = "Welcome to Pankaj Chauhan's QR Code generator".obs;

  void generateQrCode() {
    qrData.value = urlController.text;
    urlController.clear();
  }
}
