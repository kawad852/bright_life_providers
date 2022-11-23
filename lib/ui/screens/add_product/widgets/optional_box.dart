import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/titled_field.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionalBox extends StatefulWidget {
  const OptionalBox({
    Key? key,
  }) : super(key: key);

  @override
  State<OptionalBox> createState() => OptionalBoxState();
}

class OptionalBoxState extends State<OptionalBox> {
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
    return Row(
      children: [
        Expanded(
          child: TitledField(
            title: 'Optional'.tr,
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
        GetBuilder<CreateProductCtrl>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                // if (formKey.currentState!.validate()) {
                //   FocusManager.instance.primaryFocus?.unfocus();
                //   controller.add(widget.index + 1);
                //   addExtraWidgetStateKeys.add(GlobalKey());
                // }
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
    );
  }
}
