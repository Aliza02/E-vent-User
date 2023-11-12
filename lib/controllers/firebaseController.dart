import 'package:get/get.dart';

class firebaseController extends GetxController {
  // profile data variables
  final RxString userId = ''.obs;
  final RxString businessCategory = ''.obs;
  final RxString businessName = ''.obs;
  final RxString location = ''.obs;
  final RxString phone = ''.obs;
  final RxString userName = ''.obs;
  final RxString profileImageLink = ''.obs;
  final RxBool profileImageUploaded = false.obs;
}
