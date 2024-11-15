import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/article_detail_controller.dart';

class ArticleDetailWebView extends StatefulWidget {
  @override
  _ArticleDetailWebViewState createState() => _ArticleDetailWebViewState();
}

class _ArticleDetailWebViewState extends State<ArticleDetailWebView> {
  final ArticleDetailController controller = Get.put(ArticleDetailController());
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Initialize WebView
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
          },
          onPageFinished: (String url) {
          },
          onWebResourceError: (WebResourceError error) {
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article WebView"),
      ),
      body: Obx(() {
        if (controller.url.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        _webViewController.loadRequest(Uri.parse(controller.url.value));
        return WebViewWidget(controller: _webViewController);
      }),
    );
  }
}