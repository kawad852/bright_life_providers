import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredBox extends StatefulWidget {
  final int number, length, index;
  final String? title;
  final double? price;

  const RequiredBox({
    Key? key,
    required this.number,
    required this.length,
    required this.index,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  State<RequiredBox> createState() => RequiredBoxState();
}

class RequiredBoxState extends State<RequiredBox> {
  late TextEditingController nameCtrl, priceCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validator(value) {
    if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

  @override
  void initState() {
    nameCtrl = TextEditingController(text: widget.title);
    priceCtrl = TextEditingController(text: widget.price == null ? null : widget.price.toString());
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
          Opacity(
            opacity: widget.length == 1 ? 0 : 1,
            child: GestureDetector(
              onTap: widget.length != 1
                  ? () {
                      RequiredGroupsCtrl.find.removeItem(widget.index, widget.number);
                    }
                  : null,
              child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 7, 0, 0),
                child: Icon(
                  Icons.remove_circle_outline,
                  color: MyColors.red303,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
