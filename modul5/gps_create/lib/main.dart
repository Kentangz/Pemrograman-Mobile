import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/views/home_view.dart';


void main() {
  runApp(
    GetMaterialApp(
      title: "GPS Application",
      home: HomeView(), // Ganti dengan HomeView
    ),
  );
}
