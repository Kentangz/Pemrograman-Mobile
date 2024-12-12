import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/get_connect_controller.dart';
import '../../components/card_article.dart';
import '../../../modules/connections/controllers/connection_controller.dart'; // Import ConnectionController
import 'package:connectivity_plus/connectivity_plus.dart';

class GetConnectView extends GetView<GetConnectController> {
  const GetConnectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance dari ConnectionController
    final connectionController = Get.find<ConnectionController>();

    // Pastikan status koneksi diupdate sebelum menampilkan tampilan
    if (connectionController.connectivityResult == ConnectivityResult.none) {
      // Jika tidak ada koneksi, navigasi ke NoConnectionView
      Future.microtask(() => Get.offAllNamed('/no_connection'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Connect'),
      ),
      body: Obx(() {
        // Menampilkan indikator pemuatan saat data sedang diambil
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
            ),
          );
        } else {
          // Menampilkan daftar artikel
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              var article = controller.articles[index];
              return CardArticle(article: article);
            },
          );
        }
      }),
    );
  }
}
