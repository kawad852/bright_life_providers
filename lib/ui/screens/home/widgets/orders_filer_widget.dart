import 'package:bright_life_providers/controllers/home/filter_ctrl.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/filter_list_tile.dart';
import 'package:bright_life_providers/ui/widgets/custom_fab_button.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:bright_life_providers/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrdersFilterWidget extends StatelessWidget {
  const OrdersFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: move to binding later
    Get.put(FilterCtrl());
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
              Get.bottomSheet(
                SizedBox(
                  height: Get.height / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: GetBuilder<FilterCtrl>(
                      builder: (controller) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 25.0, top: 15),
                              child: Text(
                                'Order Status'.tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kPending, value!);
                              },
                              title: kPending.tr,
                              value: controller.selectedStatus.value == kPending
                                  ? true
                                  : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kReceiving, value!);
                              },
                              title: kReceiving.tr,
                              value:
                                  controller.selectedStatus.value == kReceiving
                                      ? true
                                      : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kReceived, value!);
                              },
                              title: kReceived.tr,
                              value:
                                  controller.selectedStatus.value == kReceived
                                      ? true
                                      : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kInProgress, value!);
                              },
                              title: kInProgress.tr,
                              value:
                                  controller.selectedStatus.value == kInProgress
                                      ? true
                                      : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kDelivering, value!);
                              },
                              title: kDelivering.tr,
                              value:
                                  controller.selectedStatus.value == kDelivering
                                      ? true
                                      : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kCompleted, value!);
                              },
                              title: kCompleted.tr,
                              value:
                                  controller.selectedStatus.value == kCompleted
                                      ? true
                                      : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kCanceled, value!);
                              },
                              title: kCanceled.tr,
                              value:
                                  controller.selectedStatus.value == kCanceled
                                      ? true
                                      : false,
                            ),
                            StatusListTile(
                              onChanged: (bool? value) {
                                controller.toggle(kRejected, value!);
                              },
                              title: kRejected.tr,
                              value:
                                  controller.selectedStatus.value == kRejected
                                      ? true
                                      : false,
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
                ),
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ).then(
                (value) {
                  FilterCtrl.find.filter();
                },
              );
            },
            child: SvgPicture.asset(MyIcons.filter),
          ),
        ],
      ),
    );
  }
}
