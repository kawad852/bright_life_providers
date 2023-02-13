import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/base/colors.dart';
import '../../../../utils/screen_size.dart';

class AddedProductSuccessfully extends StatelessWidget {
  const AddedProductSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: ScreenSize.phoneSize(
          336,
          height: false,
        ),
        height: ScreenSize.phoneSize(
          328,
          height: false,
        ),
        padding: const EdgeInsets.only(
          top: 35,
          bottom: 15,
        ),
        decoration: const BoxDecoration(
          color: MyColors.green9F2,
          borderRadius: BorderRadius.all(
            Radius.circular(
              37,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'done'.tr,
                    style: const TextStyle(
                      fontSize: 22,
                      color: MyColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Text(
                'The product has been added to the checklist It will be approved soon'
                    .tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(
                    0xff333333,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: MyColors.green8AC,
                  ),
                  child: Center(
                    child: Text(
                      'done'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
