import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cek_connectivity_plus/dependency_injection.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  DependencyInjection.init();
}
