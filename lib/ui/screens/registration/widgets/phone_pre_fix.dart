import 'package:flutter/material.dart';

import '../../../../utils/base/colors.dart';

class PhonePreFix extends StatelessWidget {
  const PhonePreFix({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: Row(
          children: const [
            SizedBox(width: 12),
            Text(
              "+962",
              style: TextStyle(color: MyColors.grey),
            ),
            SizedBox(width: 6),
            VerticalDivider(
              color: MyColors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
