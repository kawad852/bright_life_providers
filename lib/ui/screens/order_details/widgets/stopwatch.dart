import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStopwatch extends StatelessWidget {
  const CustomStopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.greenFAA.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const Text(
            '00:00:00',
            style: TextStyle(
              fontSize: 40,
              color: MyColors.text,
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.greenFAA,
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: SvgPicture.asset('assets/icons/play.svg'),
                    ),
                  ),
                  const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.text,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.greenFAA,
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: SvgPicture.asset('assets/icons/pause.svg'),
                    ),
                  ),
                  const Text(
                    'Pause',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.text,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.greenFAA,
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: SvgPicture.asset('assets/icons/stop.svg'),
                    ),
                  ),
                  const Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
