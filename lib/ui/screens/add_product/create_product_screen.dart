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
  late TextEditingController nameCtrl;
  late TextEditingController descriptionCtrl;
  late TextEditingController priceCtrl;
  late TextEditingController requiredCtrl;
  late TextEditingController optionalCtrl;
  List<Map<String, dynamic>> groups = [];

  final categoryDropDownState = GlobalKey<CategoryDropDownState>();

  String? validator(value) {
    if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

  @override
  void initState() {
    nameCtrl = TextEditingController();
    descriptionCtrl = TextEditingController();
    priceCtrl = TextEditingController();
    requiredCtrl = TextEditingController();
    optionalCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    descriptionCtrl.dispose();
    priceCtrl.dispose();
    requiredCtrl.dispose();
    optionalCtrl.dispose();
    super.dispose();
  }

  // bool _validateRequiredBoxes() {
  //   bool isValid = false;
  //   for (var element in CreateProductCtrl.find.requiredStateKeys) {
  //     if (element.currentState!.formKey.currentState!.validate()) {
  //     } else {
  //       isValid = false;
  //     }
  //   }
  //   return isValid;
  // }

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
                  groups.clear();
                  var items = [];
                  for (var element in CreateProductCtrl.find.requiredStateKeys) {
                    items.add(
                      {
                        "price": element.currentState!.priceCtrl.text,
                        "name": element.currentState!.nameCtrl.text,
                      },
                    );
                  }
                  groups.add(
                    {
                      "name": requiredCtrl.text,
                      "type": "required",
                      "items": items,
                    },
                  );
                  print("myList:: $groups");
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitledField(
                    title: 'Name'.tr,
                    textField: CustomTextField(
                      filled: true,
                      controller: nameCtrl,
                      validator: validator,
                    ),
                  ),
                  TitledField(
                    title: 'Description'.tr,
                    textField: CustomTextField(
                      maxLines: 3,
                      filled: true,
                      controller: descriptionCtrl,
                      validator: validator,
                    ),
                  ),
                  TitledField(
                    title: 'Price'.tr,
                    textField: CustomTextField(
                      filled: true,
                      keyboardType: TextInputType.number,
                      controller: priceCtrl,
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
                        controller: requiredCtrl,
                        validator: validator,
                      ),
                      const SizedBox(height: 8.0),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(height: 6.0),
                          shrinkWrap: true,
                          itemCount: controller.requiredStateKeys.length,
                          itemBuilder: (context, index) {
                            final data = controller.requiredStateKeys[index];
                            return RequiredBox(
                              key: data,
                              index: index,
                            );
                          }),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            controller.addRequireBox();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.add_circle_outline,
                                color: MyColors.primary,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text("Add"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        controller.showRequiredFields(true);
                        if (controller.requiredStateKeys.isEmpty) {
                          controller.addRequireBox();
                        }
                      });
                    },
                    child: Text("Add required group items".tr),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        controller.showOptionalFields(true);
                        if (controller.optionalStateKeys.isEmpty) {
                          controller.addOptionalBox();
                        }
                      });
                    },
                    child: Text("Add Optional group items".tr),
                  ),
                  const Divider(
                    height: 40.0,
                  ),
                  if (controller.isOptionalFieldsShown.value)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          padding: const EdgeInsetsDirectional.only(end: 30),
                          filled: true,
                          hintText: 'Optional group title',
                          hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
                          controller: requiredCtrl,
                          validator: validator,
                        ),
                        const SizedBox(height: 8.0),
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const SizedBox(height: 6.0),
                            shrinkWrap: true,
                            itemCount: controller.optionalStateKeys.length,
                            itemBuilder: (context, index) {
                              final data = controller.optionalStateKeys[index];
                              return OptionalBox(
                                key: data,
                                index: index,
                              );
                            }),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              controller.addOptionalBox();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: MyColors.primary,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text("Add"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          controller.showOptionalFields(true);
                          if (controller.optionalStateKeys.isEmpty) {
                            controller.addOptionalBox();
                          }
                        });
                      },
                      child: Text("Add Optional group items".tr),
                    ),
                  const SizedBox(height: 20),
                  CategoryDropDown(key: categoryDropDownState),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
