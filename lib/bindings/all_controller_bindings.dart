import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/message_controller.dart';
import '../controllers/offer_btn_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => ButtonController());
  }
}
