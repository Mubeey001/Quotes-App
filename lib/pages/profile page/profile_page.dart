import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/profile_controller.dart';
import 'package:quote_app/util/constants/color.dart';
import 'package:quote_app/util/widgets/card_form.dart';
import 'package:quote_app/util/widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.elementColor,
        title: Obx(
          () => CustomText(
            text: profileController.userName.value,
            color: Colors.white,
            size: 18,
          ),
        ),
        actions: <IconButton>[
          IconButton(
              onPressed: () => profileController.logout(),
              icon: const Icon(
                Icons.logout,
                color: AppColor.iconColor,
              ))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.elementColor,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: AppColor.backgroundColor,
                  ),
                ),
                const SizedBox(height: 20),
                CardWidget(
                  color: AppColor.elementColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: AppColor.iconColor,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                text:
                                    'Full Name: ${profileController.fullName.value}',
                                size: 16.0,
                                color: Colors.white,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle_outlined,
                              color: AppColor.iconColor,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                text:
                                    'Username: ${profileController.userName.value}',
                                size: 16.0,
                                color: Colors.white,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              color: AppColor.iconColor,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                text: 'Email: ${profileController.email.value}',
                                size: 16.0,
                                color: Colors.white,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
