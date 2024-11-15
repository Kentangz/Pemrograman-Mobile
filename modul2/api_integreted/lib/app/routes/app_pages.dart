import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/article_detail/bindings/article_detail_binding.dart';
import '../modules/article_detail/views/article_detail_web_view.dart';
import '../modules/http/bindings/http_binding.dart';  // Import binding HTTP
import '../modules/http/views/http_view.dart';  // Import HttpView

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Halaman awal aplikasi
  static const INITIAL = Routes.HOME;

  static final routes = [
    // Route untuk halaman Home
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),  // Hapus const di sini
      binding: HomeBinding(),
    ),
    
    // Route untuk halaman WebView Artikel
    GetPage(
      name: _Paths.ARTICLE_DETAIL,
      page: () => ArticleDetailWebView(),  // Hapus argument di sini
      binding: ArticleDetailBinding(),
    ),
    
    // Route untuk halaman HTTP
    GetPage(
      name: _Paths.HTTP,
      page: () => HttpView(),  // Hapus const di sini
      binding: HttpBinding(),  // Pastikan ada binding untuk Http
    ),
  ];
}
