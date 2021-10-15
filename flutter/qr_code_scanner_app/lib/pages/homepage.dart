import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner_app/controller/qr_view_controller.dart';
import 'package:qr_code_scanner_app/pages/output_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QrController qrController = Get.put(QrController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(),
                  onQRViewCreated: qrController.onQRViewCreated)),
          SizedBox(
            height: 200,
            child: Center(
              child: ElevatedButton(
                  onPressed: () => Get.to(() => OutPutPage()),
                  child: const Text('Capture'),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 60))),
            ),
          )
        ],
      ),
    );
  }
}
