import 'package:flutter/material.dart';
import 'package:quote_app/util/constants/color.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  const CardWidget({
    super.key,
    required this.child,
    this.color = AppColor.elementBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.elementColor, width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
      child: child,
    );
  }
}
