import 'package:get/get.dart';

class drawerController extends GetxController {
  RxInt currentindex = 0.obs;
  RxInt indexOfDrawerMenuItems = 0.obs; //
  void changeIndex(int index) {
    currentindex.value = index;
  }
}
