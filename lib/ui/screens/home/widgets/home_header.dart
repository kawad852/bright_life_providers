import 'package:bright_life_providers/ui/screens/notification/notification.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${"Hi".tr} ${MySharedPreferences.fName}",
              style: const TextStyle(
                color: MyColors.primary,
                fontSize: 26,
              ),
            ),
            Text(
              "Always Be Ready To Work".tr,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(() => const NotificationScreen());
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: const Size(66.0, 66.0),
            backgroundColor: MyColors.primary.withOpacity(0.15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: SvgPicture.asset(
            MyIcons.bell,
          ),
        ),
      ],
    );
  }
}
