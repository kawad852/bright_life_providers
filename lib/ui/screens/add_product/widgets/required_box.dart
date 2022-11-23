import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredBox extends StatefulWidget {
  final int index;

  const RequiredBox({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<RequiredBox> createState() => RequiredBoxState();
}

class RequiredBoxState extends State<RequiredBox> {
  late TextEditingController nameCtrl, priceCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _getIcon(int index) {
    if (CreateProductCtrl.find.requiredStateKeys.length == 1) {
      return const Icon(
        Icons.add_circle_outline,
        color: MyColors.primary,
      );
    } else {
      if (index == CreateProductCtrl.find.requiredStateKeys.length - 1) {
        return const Icon(
          Icons.add_circle_outline,
          color: MyColors.primary,
        );
      } else {
        return const Icon(
          Icons.remove_circle_outline,
          color: MyColors.red303,
        );
      }
    }
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
    priceCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              hintText: 'Name'.tr,
              hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
              filled: true,
              controller: nameCtrl,
              validator: validator,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: CustomTextField(
              hintText: 'Price'.tr,
              hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
              keyboardType: TextInputType.number,
              filled: true,
              controller: priceCtrl,
              validator: validator,
            ),
          ),
          GetBuilder<CreateProductCtrl>(
            builder: (controller) {
              return GestureDetector(
                onTap: () {
                  if (CreateProductCtrl.find.requiredStateKeys.length == 1) {
                    if (CreateProductCtrl.find.requiredStateKeys.last.currentState!.formKey.currentState!.validate()) {
                      CreateProductCtrl.find.addRequireBox(widget.index);
                      print("myList:: ${CreateProductCtrl.find.requiredStateKeys}");
                    }
                  } else {
                    if (widget.index == CreateProductCtrl.find.requiredStateKeys.length - 1) {
                      CreateProductCtrl.find.removeRequiredBox(widget.index);
                      print("myList:: ${CreateProductCtrl.find.requiredStateKeys}");
                    } else {}
                  }
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 7, 0, 0),
                  child: _getIcon(widget.index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
