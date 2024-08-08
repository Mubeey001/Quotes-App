import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/firebase_options.dart';
import 'package:quote_app/pages/home%20page/home_page.dart';
import 'package:quote_app/pages/login%20page/login_page.dart';
import 'package:quote_app/pages/profile%20page/profile_page.dart';
import 'package:quote_app/pages/registration%20page/registration_page.dart';
import 'package:quote_app/routes/routes.dart';
import 'package:quote_app/backend%20services/auth/login_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginAuth = LoginAuth();

    return GetMaterialApp(
      getPages: [
        GetPage(
          name: Routes.homePageRoute,
          page: () => HomePage(),
        ),
        GetPage(
          name: Routes.loginPageRoute,
          page: () => LoginPage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: Routes.registrationPageRoute,
          page: () => RegistrationPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.profilePageRoute,
          page: () => const ProfilePage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: "Quotes App",
      home: loginAuth.currentUser != null ? HomePage() : LoginPage(),
    );
  }
}
