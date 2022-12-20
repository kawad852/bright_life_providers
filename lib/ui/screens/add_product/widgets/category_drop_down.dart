import 'package:bright_life_providers/controllers/add_product/categories_api.dart';
import 'package:bright_life_providers/models/add_product/categories_model.dart';
import 'package:bright_life_providers/ui/widgets/failed_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category'.tr,
          style: const TextStyle(color: MyColors.grey397, fontSize: 16),
        ),
        GetBuilder<CategoriesCtrl>(builder: (controller) {
          return FutureBuilder<CategoriesModel?>(
            future: controller.initialize,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    return DropdownButtonFormField<int?>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      value: controller.categoryId,
                      onChanged: (value) {
                        setState(() {
                          chosenType = controller.categoriesList.where((element) => element.id == value).first.name;
                          controller.categoryId = value;
                          controller.update();
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return AppConstants.requiredField;
                        }
                        return null;
                      },
                      decoration: kTypeDropDownDecoration,
                      items: controller.categories,
                    );
                  } else {
                    return const FailedWidget();
                  }
              }
            },
          );
        })
      ],
    );
  }
}
