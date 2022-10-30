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
            shape: const CircleBorder(),
            fixedSize: const Size(50, 50),
          ),
          child: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
