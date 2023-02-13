import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Function function;

  const CustomBackButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsetsDirectional.only(
            start: 5,
          ),
          elevation: 0,
          backgroundColor: MyColors.greyFF0,
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          color: MyColors.primary,
          size: 20,
        ),
      ),
    );
  }
}
