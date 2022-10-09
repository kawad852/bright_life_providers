import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hi Green",
              style: TextStyle(
                color: MyColors.primary,
                fontSize: 26,
              ),
            ),
            Text(
              "Always Be Ready To Work",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
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
