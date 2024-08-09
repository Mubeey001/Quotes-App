import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/profile_controller.dart';
import 'package:quote_app/util/constants/color.dart';
import 'package:quote_app/util/widgets/info_widget.dart';
import 'package:quote_app/util/widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.elementColor,
                  AppColor.backgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Obx(
                        () => CustomText(
                          text: profileController.userName.value,
                          color: Colors.white,
                          size: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.white),
                      onPressed: () => profileController.logout(),
                    )
                  ])),
          Positioned.fill(
            top: 150,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, -5))
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColor.elementColor,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: AppColor.backgroundColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Obx(() => buildProfileDetail(
                          icon: Icons.person_outline,
                          label: 'Full Name',
                          value: profileController.fullName.value)),
                      const Divider(color: Colors.grey, height: 30),
                      Obx(() => buildProfileDetail(
                          icon: Icons.account_circle_outlined,
                          label: 'Username',
                          value: profileController.userName.value)),
                      const Divider(color: Colors.grey, height: 30),
                      Obx(() => buildProfileDetail(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          value: profileController.email.value)),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
