import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomFABButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomFABButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 66,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FloatingActionButton.extended(
          backgroundColor: MyColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: onPressed,
          label: Text(
            title,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
