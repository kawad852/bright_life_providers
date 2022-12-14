import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/group_item_box.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupBubble extends StatefulWidget {
  final int index, length;
  final String? title, type;

  const GroupBubble({
    Key? key,
    required this.index,
    required this.title,
    required this.length,
    this.type,
  }) : super(key: key);

  @override
  State<GroupBubble> createState() => GroupBubbleState();
}

class GroupBubbleState extends State<GroupBubble> {
  late TextEditingController titleCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final requiredBoxStates = <GlobalKey<GroupItemBoxState>>[GlobalKey()];
  List<String> options = <String>[kRequired, kOptional];
  String? dropdownValue;

  String? validator(value) {
    if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

  @override
  void initState() {
    titleCtrl = TextEditingController(text: widget.title);
    dropdownValue = widget.type;
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
          child: Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: MyColors.green9F2,
              borderRadius: BorderRadius.circular(37),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.removeGroup(widget.index);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: MyColors.red303,
                        ),
                        child: const Icon(Icons.remove_circle),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 150,
                      margin: const EdgeInsetsDirectional.only(end: 10, top: 20),
                      child: DropdownButtonFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return AppConstants.requiredField;
                          }
                          return null;
                        },
                        value: dropdownValue,
                        items: options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value.tr),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                          controller.editType(value!, widget.index);
                        },
                        decoration: kBubbleDropDownDecoration,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: titleCtrl,
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 40),
                  filled: true,
                  hintText: 'Title'.tr,
                  hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
                  onChanged: (value) {
                    controller.editTitle(value, widget.index);
                  },
                  validator: validator,
                ),
                const SizedBox(height: 8.0),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, number) => const SizedBox(height: 6.0),
                  shrinkWrap: true,
                  itemCount: controller.groups[widget.index].items!.length,
                  itemBuilder: (context, number) {
                    final data = controller.groups[widget.index].items![number];
                    return GroupItemBox(
                      key: requiredBoxStates[number],
                      length: controller.groups[widget.index].items!.length,
                      index: widget.index,
                      number: number,
                      title: data.name,
                      price: data.price,
                      myKey: requiredBoxStates[number],
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      var isBubbleValid = controller.bubbleKeys[widget.index].currentState!.formKey.currentState!.validate();
                      var isBoxValid = true;
                      for (var element in controller.bubbleKeys[widget.index].currentState!.requiredBoxStates) {
                        if (!element.currentState!.formKey.currentState!.validate()) {
                          isBoxValid = false;
                        }
                      }
                      if (isBubbleValid && isBoxValid) {
                        requiredBoxStates.add(GlobalKey());
                        controller.addItem(widget.index);
                      }
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
