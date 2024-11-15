import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailController extends GetxController {
  var url = ''.obs;  // Observable untuk URL
  late WebViewController webViewController;  // Kontroler WebView

  @override
  void onInit() {
    super.onInit();
    // Ambil URL dari argumen jika ada
    if (Get.arguments != null && Get.arguments['url'] != null) {
      url.value = Get.arguments['url'];
    }

    // Inisialisasi WebViewController
    webViewController = WebViewController();
  }
}
