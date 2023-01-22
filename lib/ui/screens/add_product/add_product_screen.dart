import 'package:bright_life_providers/ui/screens/add_product/widgets/category_drop_down.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/group_item_box.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/optional_box.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/titled_field.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final addSizeWidgetStateKeys = <GlobalKey<GroupItemBoxState>>[GlobalKey()];
final addExtraWidgetStateKeys = <GlobalKey<OptionalBoxState>>[GlobalKey()];

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl, descriptionCtrl, priceCtrl;

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
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    descriptionCtrl.dispose();
    priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: showFab
      // ? CustomFABButton(
      //     title: "Save Changes".tr,
      //     onPressed: () {
      //       var sizesValidators = [];
      //       // var extrasValidators = [];
      //       for (var element in addSizeWidgetStateKeys) {
      //         if (element.currentState!.formKey.currentState!.validate()) {
      //           sizesValidators.add(true);
      //           ProviderOrderCtrl.find.addSize(
      //             name: element.currentState!.nameCtrl.text,
      //             price: double.parse(element.currentState!.priceCtrl.text),
      //           );
      //         } else {
      //           sizesValidators.add(false);
      //         }
      //       }
      //       for (var element in addExtraWidgetStateKeys) {
      //         ProviderOrderCtrl.find.addExtra(
      //           name: element.currentState!.nameCtrl.text,
      //           price: double.parse(element.currentState!.priceCtrl.text.isEmpty ? '0.0' : element.currentState!.priceCtrl.text),
      //         );
      //       }
      //       // for (var element in addExtraWidgetStateKeys) {
      //       //   if (element.currentState!.formKey.currentState!.validate()) {
      //       //     extrasValidators.add(true);
      //       //     ProviderOrderCtrl.find.addExtra(
      //       //       name: element.currentState!.nameCtrl.text,
      //       //       price: double.parse(element.currentState!.priceCtrl.text),
      //       //     );
      //       //   } else {
      //       //     extrasValidators.add(false);
      //       //   }
      //       // }
      //       if (_formKey.currentState!.validate() && !sizesValidators.contains(false)) {
      //         FocusManager.instance.primaryFocus?.unfocus();
      //         ProviderOrderCtrl.find.fetchOrder(
      //           name: nameCtrl.text,
      //           price: double.parse(priceCtrl.text),
      //           content: descriptionCtrl.text,
      //           type: ProviderOrderCtrl.find.type.value,
      //           context: context,
      //         );
      //       }
      //     },
      //   )
      // : null,
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
            key: _formKey,
            child: Column(
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
                // GetBuilder<AddSizeCtrl>(
                //   //TODO: move to binding later
                //   init: AddSizeCtrl(),
                //   builder: (controller) {
                //     return ListBody(
                //       children: controller.fields.map((element) {
                //         return RequiredBox(
                //           key: addSizeWidgetStateKeys[element],
                //           index: element,
                //         );
                //       }).toList(),
                //     );
                //   },
                // ),
                // GetBuilder<AddExtraCtrl>(
                //   //TODO: move to binding later
                //   init: AddExtraCtrl(),
                //   builder: (controller) {
                //     return ListBody(
                //       children: controller.fields.map((element) {
                //         return OptionalBox(
                //           key: addExtraWidgetStateKeys[element],
                //           index: element,
                //         );
                //       }).toList(),
                //     );
                //   },
                // ),
                const CategoryDropDown(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
