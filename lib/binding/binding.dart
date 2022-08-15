import 'package:get/get.dart';
import 'package:webullish/controller/notifycontroller.dart';

class binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => notifycontroller());
  }
}
