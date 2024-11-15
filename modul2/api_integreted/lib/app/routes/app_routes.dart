part of 'app_pages.dart';

abstract class Routes {
  Routes._();  // Constructor private

  // Definisikan nama-nama route yang digunakan dalam aplikasi
  static const HOME = _Paths.HOME;  // Route untuk halaman utama (Home)
  static const ARTICLE_DETAIL = _Paths.ARTICLE_DETAIL;  // Route untuk halaman detail artikel
  static const HTTP = _Paths.HTTP;  // Pastikan ada route untuk HTTP
}

abstract class _Paths {
  _Paths._();  // Constructor private

  // Path dari route yang akan digunakan
  static const HOME = '/home';  // Path untuk HomeView
  static const ARTICLE_DETAIL = '/article-detail';  // Path untuk WebView artikel
  static const HTTP = '/http';  // Path untuk HTTP View
}
