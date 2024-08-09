import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/backend%20services/auth/login_auth.dart';
import 'package:quote_app/routes/routes.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final LoginAuth loginAuth = LoginAuth();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (loginAuth.currentUser != null) {
      Get.offAllNamed(Routes.homePageRoute);
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      await loginAuth.loginUser(
        emailController.text,
        passwordController.text,
      );
      Get.snackbar('Success', 'Login successful', snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(Routes.homePageRoute);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  
}
