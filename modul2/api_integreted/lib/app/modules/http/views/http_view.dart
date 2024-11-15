import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/http_controller.dart'; // Jalur ke HttpController yang benar

class HttpView extends StatelessWidget {
  const HttpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menghubungkan HttpController
    final HttpController httpController = Get.put(HttpController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Data'),
      ),
      body: Obx(() {
        if (httpController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (httpController.articles.isEmpty) {
          return const Center(child: Text('Tidak ada artikel yang ditemukan'));
        }

        return ListView.builder(
          itemCount: httpController.articles.length,
          itemBuilder: (context, index) {
            final article = httpController.articles[index];
            return Card(
              child: ListTile(
                title: Text(article.title),
                subtitle: Text(article.author ?? 'Penulis Tidak Dikenal'),
                onTap: () {
                  // Aksi jika artikel di-tap, misalnya navigasi ke detail artikel
                },
              ),
            );
          },
        );
      }),
    );
  }
}
