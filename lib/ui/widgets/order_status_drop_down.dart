import 'package:bright_life_providers/controllers/order_status_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:bright_life_providers/controllers/home/view_order_ctrl.dart';
import 'package:bright_life_providers/models/orders/view_order_model.dart';
import 'package:bright_life_providers/ui/screens/order_details/widgets/order_item.dart';
import 'package:bright_life_providers/ui/screens/order_details/widgets/price_item.dart';
import 'package:bright_life_providers/ui/screens/order_details/widgets/stopwatch.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_network_image.dart';
import 'package:bright_life_providers/ui/widgets/failed_widget.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderStatusDropDown extends StatelessWidget {
  final String docId;

  const OrderStatusDropDown({Key? key, required this.docId,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusCtrl>(builder: (controller) {
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
                (e) => DropdownMenuItem(
                  value: e,
                  child: Center(child: Text(e)),
                ),
              )
              .toList(),
          onChanged: (value ) {
            controller.updateStats(value, docId);
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
    });
  }
}
