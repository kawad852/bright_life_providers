import 'package:bright_life_providers/controllers/add_product/add_product_ctrl.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String? dropdownValue;

  String? validator(value) {
    if (value == null) {
      return AppConstants.requiredField;
    } else if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

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
          value: dropdownValue,
          onChanged: (value) {
            setState(() {
              ProviderOrderCtrl.find.type.value = value!;
              dropdownValue = value;
            });
          },
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: MyColors.white,
            isDense: true,
            hintText: 'Select Category'.tr,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromRGBO(39, 39, 49, 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: MyColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: MyColors.red868),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: MyColors.red868),
            ),
            errorStyle: const TextStyle(color: MyColors.red868),
          ),
          items: list.map<DropdownMenuItem<String>>((String value) {
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
