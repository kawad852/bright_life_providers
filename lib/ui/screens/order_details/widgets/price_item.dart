import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class PriceItemTile extends StatelessWidget {

  final String title;
  final String price;

  const PriceItemTile({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: MyColors.text,
              fontSize: 14,
            ),
          ),
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
