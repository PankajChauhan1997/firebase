import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class scan_qr_controller extends GetxController {
  RxString qrResult = 'Your search will be appear here'.obs;

  Future<void> scanqr() async {
    try {
      final qrcode = await FlutterBarcodeScanner.scanBarcode(
          '#FFE3F2FD', 'Cancel', true, ScanMode.QR);
      qrResult.value = qrcode;
    } on PlatformException {
      qrResult = 'Failed to read qr code'.obs;
    }
  }
}
