import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class OrderItemTile extends StatelessWidget {
  final int count;
  final String title;
  final String price;

  const OrderItemTile({
    Key? key,
    required this.count,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            'x$count',
            style: const TextStyle(
              color: MyColors.text,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
              color: MyColors.grey070,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            '$price JOD',
            style: const TextStyle(
              color: MyColors.text,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
