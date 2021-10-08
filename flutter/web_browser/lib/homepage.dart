import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_browser/controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final MyWebViewController webViewController = Get.put(MyWebViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('WebView'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Paste link here'),
                  onSubmitted: (val) {
                    webViewController.changeUrl(val);
                  }),
            ),
          ),
          actions: [
            Center(child: Text(webViewController.loading.value)),
            IconButton(
              onPressed: () async {
                webViewController.webController!.reload();
              },
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
                onPressed: () async {
                  if (await webViewController.webController!.canGoBack()) {
                    webViewController.webController!.goBack();
                  }
                },
                icon: const Icon(Icons.arrow_left)),
            IconButton(
                onPressed: () async {
                  if (await webViewController.webController!.canGoForward()) {
                    webViewController.webController!.goForward();
                  }
                },
                icon: const Icon(Icons.arrow_right))
          ],
        ),
        body: WebView(
          initialUrl: webViewController.url.value,
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (int progress) {
            webViewController.loading.value = 'loading :'+progress.toString();
          },
          onWebViewCreated: (controller) async {
            webViewController.webController = controller;
          },
          onPageFinished: (val) {
            webViewController.loading.value = '';
          },
        ),
      );
    });
  }
}
