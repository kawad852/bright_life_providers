import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductBubble extends StatefulWidget {
  final int index;
  final String? title;

  const ProductBubble({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  State<ProductBubble> createState() => ProductBubbleState();
}

class ProductBubbleState extends State<ProductBubble> {
  late TextEditingController titleCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validator(value) {
    if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

  @override
  void initState() {
    titleCtrl = TextEditingController(text: widget.title);
    super.initState();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequiredGroupsCtrl>(
      builder: (controller) {
        return Form(
          key: formKey,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                decoration: BoxDecoration(
                  color: MyColors.green9F2,
                  borderRadius: BorderRadius.circular(37),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: titleCtrl,
                      padding: const EdgeInsetsDirectional.only(end: 30, start: 0),
                      filled: true,
                      hintText: 'Required group title',
                      hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
                      onChanged: (value) {
                        controller.addTitle(value, widget.index);
                      },
                      validator: validator,
                    ),
                    const SizedBox(height: 8.0),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, number) => const SizedBox(height: 6.0),
                      shrinkWrap: true,
                      itemCount: controller.myList[widget.index].items!.length,
                      itemBuilder: (context, number) {
                        controller.boxStateKeys.add(GlobalKey());
                        final data = controller.myList[widget.index].items![number];
                        return RequiredBox(
                          key: controller.boxStateKeys[number],
                          length: controller.myList[widget.index].items!.length,
                          index: widget.index,
                          number: number,
                          title: data.name,
                          price: data.price,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          if (controller.boxStateKeys.any((element) => !element.currentState!.formKey.currentState!.validate())) return;
                          controller.addItem(widget.index);
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
              ),
              PositionedDirectional(
                top: 6,
                start: 0,
                child: ElevatedButton(
                  onPressed: () {
                    controller.removeList(widget.index);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: MyColors.red303,
                  ),
                  child: const Icon(Icons.remove_circle),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
