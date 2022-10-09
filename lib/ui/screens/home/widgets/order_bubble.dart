import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class OrderBubble extends StatelessWidget {
  final String title, status;

  const OrderBubble({
    Key? key,
    required this.title,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title,
            style: const TextStyle(fontSize: 16, color: MyColors.textBlack),
          ),
          Text(
            status,
            //TODO: color based on status
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
