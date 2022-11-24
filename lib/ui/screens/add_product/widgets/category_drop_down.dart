import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  State<CategoryDropDown> createState() => CategoryDropDownState();
}

class CategoryDropDownState extends State<CategoryDropDown> {
  String? chosenType;

  final types = [
    'Maintenance',
    'Home finishing',
    'Others',
  ];

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
          value: chosenType,
          onChanged: (value) {
            setState(() {
              chosenType = value!;
            });
          },
          validator: (value) {
            if (value == null) {
              return AppConstants.requiredField;
            } else if (value.isEmpty) {
              return AppConstants.requiredField;
            }
            return null;
          },
          decoration: kTypeDropDownDecoration,
          items: types.map<DropdownMenuItem<String>>((String value) {
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
