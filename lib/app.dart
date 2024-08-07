import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/pages/home%20page/home_page.dart';
//import 'package:quote_app/pages/login%20page/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "Quotes App",
      home: HomePage(),
    );
  }
}
