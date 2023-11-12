import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/controllers/firebaseController.dart';
import 'package:eventually_user/firebasemethods/userAuthentication.dart';
import 'package:eventually_user/widget/profile/profileHeading.dart';
import 'package:eventually_user/widget/profile/profileText.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../widget/profile/editProfileContainer.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final firebasecontroller = Get.put(firebaseController());

  File? image;
  final picker = ImagePicker();

  String userName = '';

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    String imageLink;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceBoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceBoot.child(auth.currentUser!.uid.toString());
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(image!.path));
      imageLink = await referenceImageToUpload.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser!.uid)
          .set(
        {
          'Profile image': imageLink,
        },
        SetOptions(merge: true),
      );

      print(imageLink);
      firebasecontroller.profileImageLink.value = imageLink;
      firebasecontroller.profileImageUploaded.value = true;
      print(firebasecontroller.profileImageUploaded.value);
    } catch (error) {
      print(error);
      print('error');
    }
  }

  Future<void> userDetail() async {
    await FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        if (element.id.contains(auth.currentUser!.uid)) {
          firebasecontroller.userName.value = element.data()['name'];
          firebasecontroller.phone.value = element.data()['Phone'];
        }
      });
    });

    print('future');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.18,
                decoration: BoxDecoration(
                  color: AppColors.appBar.withOpacity(0.2),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Get.width * 0.02,
                      top: Get.height * 0.01,
                    ),
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: Get.width * 0.09,
                      // top: Get.height * 0.04,
                    ),
                    child: heading(title: 'Edit Profile'),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Container(
                            margin: EdgeInsets.only(
                              top: Get.height * 0.01,
                            ),
                            child:
                                firebasecontroller.profileImageUploaded.value ==
                                        false
                                    ? InkWell(
                                        onTap: () {
                                          openImagePicker();
                                        },
                                        child: CircleAvatar(
                                          radius: 50.0,
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.3),
                                          child: const Icon(
                                            Icons.add_a_photo,
                                            color: Colors.grey,
                                            size: 30.0,
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            firebasecontroller
                                                .profileImageLink.value),
                                      ),
                          ),
                        ),
                        Obx(
                          () => firebasecontroller.profileImageUploaded.value ==
                                  true
                              ? InkWell(
                                  onTap: () async {
                                    final docRef = FirebaseFirestore.instance
                                        .collection("User")
                                        .doc(auth.currentUser!.uid);
                                    docRef
                                        .get()
                                        .then((DocumentSnapshot doc) async {
                                      final data =
                                          doc.data() as Map<String, dynamic>;
                                      final Imagelink = data['Profile image'];

                                      await FirebaseStorage.instance
                                          .refFromURL(Imagelink)
                                          .delete();

                                      await FirebaseFirestore.instance
                                          .collection("User")
                                          .doc(auth.currentUser!.uid)
                                          .set(
                                        {
                                          'Profile image': '',
                                        },
                                        SetOptions(merge: true),
                                      );
                                    });

                                    openImagePicker();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.01),
                                    child: profileText(
                                        title: 'edit photo',
                                        fontSize: Get.width * 0.03,
                                        fontWeight: AppFonts.bold,
                                        fontColor: AppColors.pink),
                                  ),
                                )
                              : SizedBox(),
                        ),
                        FutureBuilder(
                            future: userDetail(),
                            builder: (context, snapshot) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: Get.width * 0.03),
                                    child: profileText(
                                      title:
                                          "* Click on the field to change the following field.",
                                      fontColor:
                                          AppColors.grey.withOpacity(0.5),
                                      fontSize: Get.width * 0.03,
                                      fontWeight: AppFonts.bold,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(
                                      top: Get.height * 0.03,
                                      left: Get.width * 0.03,
                                    ),
                                    child: profileText(
                                      title: "Personal Information",
                                      fontColor: AppColors.grey,
                                      fontSize: Get.width * 0.06,
                                      fontWeight: AppFonts.bold,
                                    ),
                                  ),
                                  editProfileContainer(
                                    title: firebasecontroller.userName.value,
                                    icon: AppIcons.profileName,
                                    opacity: 0.3,
                                    collectionName: 'User',
                                    field: 'name',
                                  ),

                                  editProfileContainer(
                                    title: firebasecontroller.phone.value,
                                    icon: AppIcons.profilePhone,
                                    opacity: 0.0,
                                    collectionName: 'User',
                                    field: 'Phone',
                                  ),

                                  // Obx(
                                  //   () => editProfileContainer(
                                  //     title: firebasecontroller.location.value,
                                  //     icon: AppIcons.profileLocation,
                                  //     opacity: 0.0,
                                  //     collectionName: 'User',
                                  //     field: 'Business Location',
                                  //   ),
                                  // ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
