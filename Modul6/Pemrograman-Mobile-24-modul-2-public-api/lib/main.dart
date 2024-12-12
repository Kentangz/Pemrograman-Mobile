import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/connections/controllers/connection_controller.dart'; // Import ConnectionController

void main() {
  // Inisialisasi ConnectionController
  Get.put(ConnectionController()); // Inisialisasi controller agar bisa diakses di seluruh aplikasi

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
