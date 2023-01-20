import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomTextCircleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomTextCircleButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xFFC4DFAA,
            ),
            shape: CircleBorder(
              side: BorderSide(
                color: MyColors.greenFAA,
              ),
            ),
            fixedSize: const Size(
              50,
              50,
            ),
          ),
          child: const Icon(
            Icons.arrow_forward,
          ),
        ),
      ],
    );
  }
}
