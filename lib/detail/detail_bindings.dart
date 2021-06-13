import 'package:get/get.dart';
import 'package:movies_and_shows/detail/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
