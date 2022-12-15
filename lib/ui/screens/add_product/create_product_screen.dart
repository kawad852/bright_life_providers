import 'dart:convert';
import 'dart:io';

import 'package:bright_life_providers/controllers/add_product/add_product_ctrl.dart';
import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/models/items_model.dart';
import 'package:bright_life_providers/ui/screens/add_product/groups_screen.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/category_drop_down.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/titled_field.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_fab_button.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? image;
  bool showImageError = false;
  final categoryDropDownState = GlobalKey<CategoryDropDownState>();

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: source);
    if (file == null) return;
    setState(() {
      image = file;
      showImageError = false;
    });
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select'.tr),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                pickImage(ImageSource.gallery);
              },
              child: Text('Gallery'.tr),
            ),
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                pickImage(ImageSource.camera);
              },
              child: Text('Camera'.tr),
            ),
          ],
        );
      },
    );
  }

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
                // print("list:: ${RequiredGroupsCtrl.find.groups}");
                // var json = RequiredGroupsCtrl.find.groups.map((e) => e.toJson()).toList();
                // print("list:: 2 $json");
                if (image == null) {
                  setState(() {
                    showImageError = true;
                  });
                }
                if (formKey.currentState!.validate() && image != null) {
                  setState(() {
                    showImageError = false;
                  });
                  AddProductsCtrl.find.fetchAddProductsData(
                    groups: RequiredGroupsCtrl.find.groups.map((e) => e.toJson()).toList(),
                    title: nameCtrl.text,
                    description: descriptionCtrl.text,
                    price: priceCtrl.text,
                    type: categoryDropDownState.currentState!.chosenType!,
                    image: File(image!.path),
                    context: context,
                  );
                }
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
                  GestureDetector(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: image == null
                          ? const Icon(
                              Icons.image,
                              size: 40,
                              color: MyColors.primary,
                            )
                          : Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  if (showImageError)
                    Text(
                      AppConstants.requiredField,
                      style: const TextStyle(color: MyColors.red868, fontSize: 13),
                    ),
                  const SizedBox(height: 15),
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
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const GroupsScreen(type: kRequired));
                    },
                    child: Container(
                      height: 50.0,
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add groups".tr,
                            style: const TextStyle(color: MyColors.grey397, fontSize: 16),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
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
