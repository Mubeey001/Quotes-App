import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/login_controller.dart';
import 'package:quote_app/routes/routes.dart';
import 'package:quote_app/util/constants/color.dart';
import 'package:quote_app/util/validator/validate.dart';
import 'package:quote_app/util/widgets/button_widget.dart';
import 'package:quote_app/util/widgets/card_form.dart';
import 'package:quote_app/util/widgets/form_field_widget.dart';
import 'package:quote_app/util/widgets/text_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CardWidget(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const CustomText(text: "Email"),
                          FormFieldWidget(
                            text: 'Email',
                            fieldIcon: const Icon(Icons.email),
                            controller: loginController.emailController,
                            validate: (value) => AppValidator.validEmail(value),
                          ),
                          const SizedBox(height: 5),
                          const CustomText(text: "Password"),
                          FormFieldWidget(
                            text: 'Password',
                            fieldIcon: const Icon(Icons.lock),
                            controller: loginController.passwordController,
                            validate: (value) =>
                                AppValidator.validatePassword(value),
                          ),
                          const SizedBox(height: 24),
                          Obx(() {
                            return loginController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: AppColor.elementColor,
                                  ))
                                : Center(
                                    child: AppButton(
                                      text: "Login",
                                      size: 18,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          loginController.login();
                                        }
                                      },
                                    ),
                                  );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LoginRegisterButton(
                                text: "Register",
                                size: 15,
                                onPressed: () =>
                                    Get.toNamed(Routes.registrationPageRoute),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
