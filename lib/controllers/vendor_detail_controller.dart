import 'package:get/get.dart';

class vendorDetailController extends GetxController {
  RxBool showAbout = true.obs;
  RxBool showReview = false.obs;
  RxBool showServices = false.obs;
  final RxList<String> serviceName = <String>[].obs;
  final RxList<String> servicePrice = <String>[].obs;
  final RxList<String> noOfPerson = <String>[].obs;
  final RxList<String> serviceDescription = <String>[].obs;
  final RxList<String> serviceImages = <String>[].obs;

  final RxList<String> userId = <String>[].obs;
}
