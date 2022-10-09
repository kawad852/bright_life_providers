import 'package:bright_life_providers/controllers/add_product/add_order_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/add_product_screen.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/titled_field.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSizeWidget extends StatefulWidget {
  final int index;

  const AddSizeWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<AddSizeWidget> createState() => AddSizeWidgetState();
}

class AddSizeWidgetState extends State<AddSizeWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameCtrl, priceCtrl;

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
            child: TitledField(
              title: 'Required'.tr,
              textField: CustomTextField(
                filled: true,
                controller: nameCtrl,
                validator: validator,
              ),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: TitledField(
              title: 'Price'.tr,
              textField: CustomTextField(
                keyboardType: TextInputType.number,
                filled: true,
                controller: priceCtrl,
                validator: validator,
              ),
            ),
          ),
          GetBuilder<AddSizeCtrl>(
            builder: (controller) {
              return GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.add(widget.index + 1);
                    addSizeWidgetStateKeys.add(GlobalKey());
                  }
                },
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 7, 0, 0),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: MyColors.primary,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
