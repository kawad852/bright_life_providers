import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: MyColors.greyFF0,
        padding: EdgeInsets.zero,
        // fixedSize: const Size(31, 31),
      ),
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: MyColors.primary,
        size: 20,
      ),
    );
  }
}
