import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.orderNum,
    required this.status,
    required this.viewed,
    required this.createdAt
  }) : super(key: key);
  final String orderNum;
  final String status;
  final bool viewed;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(end: 10),
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:  viewed ? MyColors.greyFF0:MyColors.lightYellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                viewed ? MyIcons.notificationL:MyIcons.notificationD ,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: RichText(
                        text: TextSpan(
                          text: 'Order #$orderNum ',
                          style: const TextStyle(
                            color: MyColors.secondary,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: status == 'Delivery' ? 'on ' : 'has been ',
                              style: const TextStyle(),
                            ),
                            TextSpan(
                              text: status,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: status == 'Delivery'
                                    ? MyColors.primaryLight
                                    : MyColors.orderAccepted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      status == 'Delivery'
                          ? 'Be ready to receive it'
                          : 'It is being worked on',
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColors.grey070,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        DateFormat('h:mm a dd.MM.yyyy').format(createdAt),
                        style: const TextStyle(
                          fontSize: 14,
                          color: MyColors.grey070,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Divider(thickness: 1.2),
        )
      ],
    );
  }
}
