import 'package:bright_life_providers/controllers/order_status_ctrl.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/status.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusDropDown extends StatelessWidget {
  final String docId;

  const OrderStatusDropDown({
    Key? key,
    required this.docId,
  }) : super(key: key);

  static final nonChangingStatus = [
    kCompleted,
    kCanceled,
    kRejected,
  ];

  static Future<void> alertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'.tr),
          content: Text('You cant change order status'.tr),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusCtrl>(
      builder: (controller) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: controller.statusDDV.value,
            hint: Center(
              child: Text(
                'Order Status'.tr,
                style: const TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            items: controller.status
                .map(
                  (element) => DropdownMenuItem(
                    value: element,
                    child: Center(child: Text(element.tr)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (nonChangingStatus.contains(controller.statusDDV.value)) {
                alertDialog(context);
              } else {
                controller.changeStatusDialog(context, docId: docId, value: value!);
              }
            },
            buttonDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: MyColors.greenFAA.withOpacity(0.4),
            ),
            buttonWidth: Get.width,
            buttonHeight: 50,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            isExpanded: true,
            icon: const RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 15,
              ),
            ),
            style: const TextStyle(
              color: MyColors.textBlack,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
