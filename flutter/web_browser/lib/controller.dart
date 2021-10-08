import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewController extends GetxController {
  var url = 'https://github.com/viralvaghela/hacktoberfest_2021'.obs;
  var loading = ''.obs;
  var progress = 0.obs;
  WebViewController? webController;
  @override
  void onInit() {
    WebView.platform = SurfaceAndroidWebView();
    super.onInit();
  }

  changeUrl(url) {
    webController!.loadUrl('https://' + url);
  }
}
