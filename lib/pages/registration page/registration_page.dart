import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/registration_controller.dart';
import 'package:quote_app/routes/routes.dart';
import 'package:quote_app/util/constants/color.dart';
import 'package:quote_app/util/validator/validate.dart';
import 'package:quote_app/util/widgets/button_widget.dart';
import 'package:quote_app/util/widgets/card_form.dart';
import 'package:quote_app/util/widgets/form_field_widget.dart';
import 'package:quote_app/util/widgets/text_widget.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});
  final RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CardForm(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: "Full name"),
                          FormFieldWidget(
                            text: 'Full name',
                            fieldIcon: const Icon(Icons.person),
                            controller: registrationController.emailController,
                            validate: (value) =>
                                AppValidator.validateEmptyText(value),
                          ),
                          const SizedBox(height: 5),
                          const CustomText(text: "Username"),
                          FormFieldWidget(
                            text: 'Username',
                            fieldIcon: const Icon(Icons.person_4_rounded),
                            controller: registrationController.emailController,
                            validate: (value) =>
                                AppValidator.validateEmptyText(value),
                          ),
                          const SizedBox(height: 5),
                          const CustomText(text: "Email"),
                          FormFieldWidget(
                            text: 'Email',
                            fieldIcon: const Icon(Icons.email),
                            controller: registrationController.emailController,
                            validate: (value) => AppValidator.validEmail(value),
                          ),
                          const SizedBox(height: 5),
                          const CustomText(text: "Password"),
                          FormFieldWidget(
                            text: 'Password',
                            fieldIcon: const Icon(Icons.lock),
                            controller: registrationController.emailController,
                            validate: (value) =>
                                AppValidator.validatePassword(value),
                          ),
                          const SizedBox(height: 24),
                          Center(
                            child: AppButton(
                              text: "Register",
                              size: 18,
                              onPressed: () {},
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LoginRegisterButton(
                                text: "Login",
                                size: 15,
                                onPressed: () =>
                                    Get.offAllNamed(Routes.loginPageRoute),
                              ),
                            ],
                          )
                        ],
                      )))),
            ),
          ),
        ],
      ),
    );
  }
}
