import 'package:get/get.dart';
import 'package:quote_app/backend%20services/auth/profile_fetch.dart';
import 'package:quote_app/routes/routes.dart';

class ProfileController extends GetxController {
  final ProfileFetch _authService = ProfileFetch();

  var userName = ''.obs;
  var email = ''.obs;
  var fullName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      var user = _authService.getCurrentUser();
      if (user != null) {
        var userProfile = await _authService.getUserProfile(user.uid);
        userName.value = userProfile['username'];
        email.value = userProfile['email'];
        fullName.value = userProfile['fullname'];
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user profile: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      Get.offAllNamed(Routes.loginPageRoute);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
