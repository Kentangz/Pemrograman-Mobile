import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';

class AppPages {
  static const INITIAL = '/home';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
    ),
  ];
}
