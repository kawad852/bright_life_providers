import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersFilterWidget extends StatelessWidget {
  const OrdersFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Orders",
            style: TextStyle(fontSize: 22),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(MyIcons.filter),
          ),
        ],
      ),
    );
  }
}
