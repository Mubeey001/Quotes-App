import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/util/constants/color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double size;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.text,
    required this.size,
    required this.onPressed,
  });
//com.mubeeyTech.quoteapp
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
          elevation: 5.0,
          backgroundColor: AppColor.elementColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LoginRegisterButton extends StatelessWidget {
  final String text;
  final double size;
  final VoidCallback onPressed;
  const LoginRegisterButton({
    super.key,
    required this.text,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: AppColor.elementColor,
              fontSize: size),
        ));
  }
}
