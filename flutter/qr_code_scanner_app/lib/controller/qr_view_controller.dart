import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrController extends GetxController {
  QRViewController? controller;
  var result = 'No Result Found\nTry to capture again'.obs;


  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData.code;
    });
  }
}
