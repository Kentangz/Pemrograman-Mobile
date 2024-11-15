import 'package:api_integreted/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/http_controller.dart';


class HomeView extends StatelessWidget {
  final HttpController controller = Get.put(HttpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 0) {
                controller.fetchArticles(); // Panggil fetchArticles saat memilih menu
                Get.toNamed(Routes.HTTP);  // Navigasi ke halaman HTTP
              } else if (value == 1) {
                Get.toNamed(Routes.ARTICLE_DETAIL, arguments: {
                  'url': 'https://www.scienceopen.com/',  // Ganti dengan URL yang sesuai
                });
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('View HTTP Data'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('View Article in WebView'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
