import 'package:flutter/material.dart';
import 'package:quote_app/util/constants/color.dart';

class CardForm extends StatelessWidget {
  final Widget child;
  const CardForm({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.elementBgColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.elementColor, width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
      child: child,
    );
  }
}
