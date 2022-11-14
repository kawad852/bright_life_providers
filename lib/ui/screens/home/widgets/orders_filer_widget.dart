import 'package:bright_life_providers/controllers/filter_ctrl_refactor.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/filter_list_tile.dart';
import 'package:bright_life_providers/ui/widgets/custom_fab_button.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrdersFilterWidget extends StatelessWidget {
  const OrdersFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: move to binding later
    Get.put(KhaledFilterCtrl());
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            "Orders".tr,
            style: const TextStyle(fontSize: 22),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: Get.height / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                      child: GetBuilder<KhaledFilterCtrl>(
                        builder: (controller) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0, top: 15),
                                child: Text(
                                  'Order Status'.tr,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              StatusListTile(
                                onChanged: (bool? value) {
                                  controller.toggle('pending', value!);
                                },
                                title: 'Pending'.tr,
                                value: controller.selectedStatus.value == 'pending' ? true : false,
                              ),
                              StatusListTile(
                                onChanged: (bool? value) {
                                  controller.toggle('completed', value!);
                                },
                                title: 'Completed'.tr,
                                value: controller.selectedStatus.value == 'completed' ? true : false,
                              ),
                              const Spacer(),
                              CustomFABButton(
                                title: 'Filtering'.tr,
                                onPressed: () {
                                  controller.filter();
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ).then((value) {
                KhaledFilterCtrl.find.filter();
              });
            },
            child: SvgPicture.asset(MyIcons.filter),
          ),
        ],
      ),
    );
  }
}
