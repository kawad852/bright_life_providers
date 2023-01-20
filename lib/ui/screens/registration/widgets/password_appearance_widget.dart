import 'package:flutter/material.dart';

class PasswordAppearanceWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool obscureText;

  const PasswordAppearanceWidget({
    Key? key,
    required this.onTap,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
    );
  }
}
