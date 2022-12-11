import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredProductBubble extends StatefulWidget {
  final int index, length;
  final String? title;

  const RequiredProductBubble({
    Key? key,
    required this.index,
    required this.title,
    required this.length,
  }) : super(key: key);

  @override
  State<RequiredProductBubble> createState() => RequiredProductBubbleState();
}

class RequiredProductBubbleState extends State<RequiredProductBubble> {
  late TextEditingController titleCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // GlobalKey<RequiredBoxState> boxStateKeys = GlobalKey();
  final requiredBoxState = <GlobalKey<RequiredBoxState>>[GlobalKey()];
  List<String> options = <String>['One', 'Two'];
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
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          hintText: 'Category'.tr,
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: MyColors.textFormFieldBorder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: MyColors.textFormFieldBorder),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: MyColors.red868),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: MyColors.red868),
                          ),
                          errorStyle: const TextStyle(color: MyColors.red868),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: titleCtrl,
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 40),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, number) => const SizedBox(height: 6.0),
                  shrinkWrap: true,
                  itemCount: controller.groups[widget.index].items!.length,
                  itemBuilder: (context, number) {
                    final data = controller.groups[widget.index].items![number];
                    return RequiredBox(
                      key: requiredBoxState[number],
                      length: controller.groups[widget.index].items!.length,
                      index: widget.index,
                      number: number,
                      title: data.name,
                      price: data.price,
                      myKey: requiredBoxState[number],
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {},
                    child: Icon(
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
