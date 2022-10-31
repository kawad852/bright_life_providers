import 'package:bright_life_providers/controllers/home/filter_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/base/colors.dart';

class DateListTile extends StatelessWidget {
  final String title;
  final Function(bool? value) onChanged ;
  final filterController = Get.find<FilterController>();
  DateListTile({Key? key,required this.onChanged,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>SizedBox(
      height: 35,
      child: Row(
        children: [
          Checkbox(
            value: filterController.filterDate.value==title,
            onChanged: onChanged,
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(color: MyColors.grey070),),
            fillColor: MaterialStateProperty.all(MyColors.grey070),
          ),
          Text(
            title.tr,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ));
  }
}

class StatusListTile extends StatelessWidget {
  final String title;
  final Function(bool? value) onChanged ;
  final filterController = Get.find<FilterController>();
  StatusListTile({Key? key,required this.onChanged,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>SizedBox(
      height: 35,
      child: Row(
        children: [
          Checkbox(
            value: filterController.filterStatus.value==title,
            onChanged: onChanged,
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(color: MyColors.grey070),),
            fillColor: MaterialStateProperty.all(MyColors.grey070),
          ),
          Text(
            title.tr,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ));
  }
}
