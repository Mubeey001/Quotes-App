import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quote_app/backend%20services/auth/register_auth.dart';
import 'package:quote_app/routes/routes.dart';

class RegistrationController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var fullnameController = TextEditingController();

  final RegisterAuth registerAuth = RegisterAuth();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> register() async {
    isLoading.value = true;
    try {
      await registerAuth.registerUser(
        usernameController.text,
        fullnameController.text,
        emailController.text,
        passwordController.text,
      );

      Get.snackbar('Success', 'Registration successful',
          snackPosition: SnackPosition.BOTTOM);

      Get.offAllNamed(Routes.homePageRoute);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
