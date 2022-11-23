import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/category_drop_down.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/optional_box.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/titled_field.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_fab_button.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => CreateProductScreenState();
}

class CreateProductScreenState extends State<CreateProductScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validator(value) {
    if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

  bool _validateRequiredBoxes() {
    bool isValid = false;
    for (var element in CreateProductCtrl.find.requiredStateKeys) {
      if (element.currentState!.formKey.currentState!.validate()) {
      } else {
        isValid = false;
      }
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showFab
          ? CustomFABButton(
              title: "Save Changes".tr,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                } else {}
                // if (_formKey.currentState!.validate() && !sizesValidators.contains(false)) {
                //   FocusManager.instance.primaryFocus?.unfocus();
                //   ProviderOrderCtrl.find.fetchOrder(
                //     name: nameCtrl.text,
                //     price: double.parse(priceCtrl.text),
                //     content: descriptionCtrl.text,
                //     type: ProviderOrderCtrl.find.type.value,
                //     context: context,
                //   );
                // }
              },
            )
          : null,
      appBar: BaseAppBar(title: 'Add New Order'.tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: MyColors.green9F2,
            borderRadius: BorderRadius.circular(37),
          ),
          child: Form(
            key: formKey,
            child: GetBuilder<CreateProductCtrl>(builder: (controller) {
              return Column(
                children: [
                  TitledField(
                    title: 'Name'.tr,
                    textField: CustomTextField(
                      filled: true,
                      controller: controller.nameCtrl.value,
                      validator: validator,
                    ),
                  ),
                  TitledField(
                    title: 'Description'.tr,
                    textField: CustomTextField(
                      maxLines: 3,
                      filled: true,
                      controller: controller.descriptionCtrl.value,
                      validator: validator,
                    ),
                  ),
                  TitledField(
                    title: 'Price'.tr,
                    textField: CustomTextField(
                      filled: true,
                      keyboardType: TextInputType.number,
                      controller: controller.priceCtrl.value,
                      validator: validator,
                      suffixIcon: const Text(
                        "JOD",
                        style: TextStyle(
                          color: MyColors.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        padding: const EdgeInsetsDirectional.only(end: 30),
                        filled: true,
                        hintText: 'Required group title',
                        hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
                        controller: controller.requiredCtrl.value,
                        validator: validator,
                      ),
                      const SizedBox(height: 8.0),
                      ...controller.requiredStateKeys.map((element) {
                        final index = controller.requiredStateKeys.indexOf(element);
                        return RequiredBox(
                          key: element,
                          index: index,
                        );
                      }).toList(),
                    ],
                  ),
                  const Divider(
                    height: 40.0,
                  ),
                  ...controller.optional.map((element) {
                    return const OptionalBox();
                  }).toList(),
                  const CategoryDropDown(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
