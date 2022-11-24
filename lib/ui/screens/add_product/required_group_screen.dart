import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredGroupsScreen extends StatefulWidget {
  const RequiredGroupsScreen({Key? key}) : super(key: key);

  @override
  State<RequiredGroupsScreen> createState() => _RequiredGroupsScreenState();
}

class _RequiredGroupsScreenState extends State<RequiredGroupsScreen> {
  final groupBoxes = <TextEditingController>[];

  String? validator(value) {
    if (value!.isEmpty) {
      return AppConstants.requiredField;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<RequiredGroupsCtrl>(
        //TODO: check later
        init: RequiredGroupsCtrl(),
        builder: (controller) {
          return ListView(
            padding: const EdgeInsets.all(30.0),
            children: [
              Column(
                children: [
                  ...groupBoxes.map((element) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: MyColors.green9F2,
                            borderRadius: BorderRadius.circular(37),
                          ),
                          child: Column(
                            children: [
                              CustomTextField(
                                padding: const EdgeInsetsDirectional.only(end: 30, start: 30),
                                filled: true,
                                hintText: 'Required group title',
                                hintStyle: const TextStyle(color: MyColors.grey397, fontSize: 16),
                                controller: groupBoxes[0],
                                validator: validator,
                              ),
                              const SizedBox(height: 8.0),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) => const SizedBox(height: 6.0),
                                shrinkWrap: true,
                                itemCount: RequiredGroupsCtrl.find.items.length,
                                itemBuilder: (context, index) {
                                  final data = RequiredGroupsCtrl.find.items[index];
                                  return RequiredBox(
                                    index: index,
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {
                                    // controller.addRequireBox();
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
                          top: -17,
                          start: -17,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: MyColors.red303,
                            ),
                            child: const Icon(Icons.remove_circle),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    groupBoxes.add(TextEditingController());
                  });
                },
                child: Text("Add more".tr),
              ),
            ],
          );
        },
      ),
    );
  }
}
