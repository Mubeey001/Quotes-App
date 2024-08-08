import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/util/constants/color.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const CustomText({
    super.key,
    required this.text,
    this.size = 15.0,
    this.color = AppColor.elementColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: GoogleFonts.robotoCondensed(fontSize: size, color: color),
          ),
        ),
      ],
    );
  }
}
