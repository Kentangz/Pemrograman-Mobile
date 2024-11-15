import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import '../controllers/todo_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<BookController>(() => BookController());
  }
}