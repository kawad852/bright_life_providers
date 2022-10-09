import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class TitledField extends StatelessWidget {
  final String title;
  final Widget textField;

  const TitledField({
    Key? key,
    required this.title,
    required this.textField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: MyColors.grey397, fontSize: 16),
        ),
        textField,
        const SizedBox(height: 10),
      ],
    );
  }
}
