import 'package:flutter/material.dart';
import 'package:quote_app/util/constants/color.dart';

class CustomAppBarWidget extends StatelessWidget {
  final Icon profile;
  final void Function() onPressed;
  final Function(String) onChanged;
  final TextEditingController textEditingController;
  const CustomAppBarWidget({
    super.key,
    required this.profile,
    required this.onPressed,
    required this.textEditingController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: AppColor.elementColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: 'Search quote',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: CircleAvatar(
                    backgroundColor: AppColor.backgroundColor,
                    radius: 18,
                    child: profile,
                  ),
                  onPressed: onPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
