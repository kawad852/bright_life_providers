
import 'package:bright_life_providers/controllers/my_product/my_product_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/base/colors.dart';
import '../../../widgets/custom_network_image.dart';

class MaintenanceListItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double price;
  final int id;
  final VoidCallback onTap;

  const MaintenanceListItem({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.onTap,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: GetBuilder<MyProductsCtrl>(
          builder: (controller) {
            return Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Row(
                  children: [
                    CustomNetworkImage(
                      url: image,
                      border: 20,
                      width: 90,
                      height: 90,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                color: MyColors.secondary,
                              ),
                            ),
                            Text(
                              description,
                              style: const TextStyle(
                                fontSize: 13,
                                color: MyColors.grey,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: RichText(
                                text: TextSpan(
                                  text: '$price',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'JOD '.tr,
                                      children: [
                                        TextSpan(
                                          text: 'By hour'.tr,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: MyColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}