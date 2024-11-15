import 'package:firebaseconfig/app/modules/home/bindings/initial_binding.dart';
import 'package:firebaseconfig/app/modules/home/views/register_view.dart';
import 'package:firebaseconfig/app/modules/home/views/todo_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase di sini
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => RegisterScreen()),
        GetPage(name: '/todo', page: () => TodoPage()),
      ],
      title: 'Flutter Authentication with GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}