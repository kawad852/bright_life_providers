import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionalBox extends StatefulWidget {
  final int index;

  const OptionalBox({
    Key? key,
    required this.index,
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
          child: CustomTextField(
            filled: true,
            hintText: 'Name'.tr,
            controller: nameCtrl,
            validator: validator,
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: CustomTextField(
            keyboardType: TextInputType.number,
            filled: true,
            hintText: 'Price'.tr,
            controller: priceCtrl,
            validator: validator,
          ),
        ),
        GetBuilder<CreateProductCtrl>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                CreateProductCtrl.find.removeOptionalBox(widget.index);
              },
              child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 7, 0, 0),
                child: Icon(
                  Icons.remove_circle_outline,
                  color: MyColors.red303,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
