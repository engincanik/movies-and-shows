import 'package:get/get.dart';
import 'package:movies_and_shows/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
