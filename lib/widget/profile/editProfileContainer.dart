// import 'package:eventually_vendor/widget/profile/personalInfo.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// import '../../constants/colors.dart';
// import '../../constants/font.dart';
// import '../../constants/icons.dart';
// import '../../controller/firebaseController.dart';
// import '../../controller/pagecontroller.dart';
// import '../../firebaseMethods/addService.dart';
// import '../AddEditServices/deleteConfirmDialogButton.dart';
// import '../manageAvailability/text.dart';

// class editProfileContainer extends StatelessWidget {
//   final String title;
//   final String icon;
//   final double opacity;
//   final String collectionName;
//   final String field;

//   const editProfileContainer({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.opacity,
//     required this.collectionName,
//     required this.field,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final firebasecontroller = Get.put(firebaseController());
//     final mycontroller = TextEditingController();
//     String test;
//     return InkWell(
//       onTap: () {
//         Get.dialog(
//           transitionCurve: const ElasticInCurve(0.4),
//           transitionDuration: const Duration(milliseconds: 800),
//           AlertDialog(
//             shadowColor: AppColors.pink,
//             actionsAlignment: MainAxisAlignment.center,
//             title: text(
//               title: "Update $field",
//               fontColor: AppColors.pink,
//               fontSize: Get.width * 0.04,
//               fontWeight: AppFonts.bold,
//             ),
//             content: TextFormField(
//               controller: mycontroller,
//               cursorColor: AppColors.pink,
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(Get.width * 0.02),
//                   borderSide: const BorderSide(
//                     color: AppColors.pink,
//                     width: 1.3,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(Get.width * 0.02),
//                   borderSide: const BorderSide(
//                     color: AppColors.pink,
//                     width: 1.3,
//                   ),
//                 ),
//                 hintText: 'Enter new value',
//               ),
//             ),
//             actions: [
//               dialogButton(
//                 buttonTitle: 'Update',
//                 buttonColor: AppColors.blue,
//                 onpressed: () async {
//                   if (field == 'name') {
//                     User? user = auth.currentUser;
//                     user!.updateDisplayName(mycontroller.text);
//                     await firestore
//                         .collection(collectionName)
//                         .doc(auth.currentUser!.uid)
//                         .update({field: mycontroller.text}).then((value) => {
//                               Get.back(),
//                               firebasecontroller.userName.value =
//                                   mycontroller.text,
//                             });
//                   } else if (field == 'Phone') {
//                     await firestore
//                         .collection(collectionName)
//                         .doc(auth.currentUser!.uid)
//                         .update({field: mycontroller.text}).then((value) => {
//                               Get.back(),
//                               firebasecontroller.phone.value =
//                                   mycontroller.text,
//                             });
//                   } else if (field == 'Business Location') {
//                     await firestore
//                         .collection(collectionName)
//                         .doc(auth.currentUser!.uid)
//                         .update({field: mycontroller.text}).then((value) => {
//                               Get.back(),
//                               firebasecontroller.location.value =
//                                   mycontroller.text,
//                             });
//                   } else if (field == 'Business Name') {
//                     await firestore
//                         .collection(collectionName)
//                         .doc(auth.currentUser!.uid)
//                         .update({field: mycontroller.text}).then((value) => {
//                               Get.back(),
//                               firebasecontroller.businessName.value =
//                                   mycontroller.text,
//                             });
//                   } else {
//                     await firestore
//                         .collection(collectionName)
//                         .doc(auth.currentUser!.uid)
//                         .update({field: mycontroller.text}).then((value) => {
//                               Get.back(),
//                               firebasecontroller.businessCategory.value =
//                                   mycontroller.text,
//                             });
//                   }
//                   mycontroller.clear();
//                 },
//               ),
//               dialogButton(
//                 buttonTitle: 'Cancel',
//                 buttonColor: AppColors.pink,
//                 onpressed: () {
//                   Get.back();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//       child: Container(
//         height: Get.height * 0.08,
//         margin: EdgeInsets.only(
//           top: Get.height * 0.01,
//         ),
//         padding: const EdgeInsets.only(bottom: 12.0),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: AppColors.pink.withOpacity(0.5),
//             ),
//             top: BorderSide(
//               color: AppColors.pink.withOpacity(opacity),
//             ),
//           ),
//         ),
//         child: personalInfo(
//           textTitle: title,
//           fontSize: Get.width * 0.04,
//           icon: icon,
//           height: Get.height * 0.02,
//         ),
//       ),
//     );
//   }
// }
