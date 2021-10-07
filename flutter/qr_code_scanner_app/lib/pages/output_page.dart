import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_app/controller/qr_view_controller.dart';

// ignore: use_key_in_widget_constructors
class OutPutPage extends StatelessWidget {
  final QrController qrController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        qrController.result.value = 'No Result Found\nTry to capture again';
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Result"),
          centerTitle: true,
        ),
        body: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SelectableText(
                  qrController.result.value,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      qrController.result.value =
                          'No Result Found\nTry to capture again';
                    },
                    child: const Text('Capture Again'),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 60))),
              ),
            ],
          );
        }),
      ),
    );
  }
}
