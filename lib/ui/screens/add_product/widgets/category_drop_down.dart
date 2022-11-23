import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category'.tr,
          style: const TextStyle(color: MyColors.grey397, fontSize: 16),
        ),
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: CreateProductCtrl.find.chosenType.value,
          onChanged: CreateProductCtrl.find.toggleType,
          validator: (value) {
            if (value == null) {
              return AppConstants.requiredField;
            } else if (value.isEmpty) {
              return AppConstants.requiredField;
            }
            return null;
          },
          decoration: kTypeDropDownDecoration,
          items: CreateProductCtrl.find.types.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
