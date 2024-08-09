import 'package:get/get.dart';
import 'package:quote_app/controller/home_controller.dart';
import 'package:quote_app/controller/login_controller.dart';
import 'package:quote_app/controller/profile_controller.dart';
import 'package:quote_app/controller/registration_controller.dart';

class MyBindings extends Bindings {
  MyBindings();
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => LoginController());
    Get.put(() => HomeController());
    Get.lazyPut(() => ProfileController());
  }
}
