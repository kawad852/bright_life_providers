import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBubble extends StatelessWidget {
  final String orderNum, status;

  const OrderBubble({
    Key? key,
    required this.orderNum,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            status.tr,
            //TODO: color based on status for next version
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            orderNum,
            style: const TextStyle(fontSize: 16, color: MyColors.textBlack),
          ),
        ],
      ),
    );
  }
}
