import 'package:get/get.dart';
import '../../../data/services/http_controller.dart';  // Pastikan path ke controller sudah benar

class HttpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpController>(
      () => HttpController(),
    );
  }
}
