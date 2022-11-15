import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            fixedSize: const Size(double.infinity, 66),
            backgroundColor: MyColors.primaryLight,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: MyColors.primaryLight,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: SvgPicture.asset(MyIcons.lifeRing),
                ),
              ),
              const Spacer(),
              const Text(
                'Do you need Help ?',
                style: TextStyle(
                  fontSize: 20,
                  color: MyColors.textBlack,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
