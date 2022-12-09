import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/product_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredGroupsScreen extends StatefulWidget {
  const RequiredGroupsScreen({Key? key}) : super(key: key);

  @override
  State<RequiredGroupsScreen> createState() => _RequiredGroupsScreenState();
}

class _RequiredGroupsScreenState extends State<RequiredGroupsScreen> {
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.myList.length,
                  itemBuilder: (context, index) {
                    controller.bubbleKeys.add(GlobalKey());
                    final data = controller.myList[index];
                    return ProductBubble(
                      key: controller.bubbleKeys[index],
                      index: index,
                      title: data.name,
                    );
                  }),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  print("length:: ${RequiredGroupsCtrl.find.bubbleKeys.length} ${RequiredGroupsCtrl.find.boxStateKeys.length}");

                  bool isValid1 = true;
                  for (var element in RequiredGroupsCtrl.find.bubbleKeys) {
                    // if (element.currentState == null) return;
                    if (!element.currentState!.formKey.currentState!.validate()) {
                      isValid1 = false;
                    }
                  }

                  bool isValid2 = true;
                  for (var element in RequiredGroupsCtrl.find.boxStateKeys) {
                    // if (element.currentState == null) return;
                    if (!element.currentState!.formKey.currentState!.validate()) {
                      isValid2 = false;
                    }
                  }
                  // var isBubbleValid = RequiredGroupsCtrl.find.bubbleKeys.every((element) => element.currentState!.formKey.currentState!.validate());
                  // var isBoxValid = RequiredGroupsCtrl.find.boxStateKeys.every((element) => element.currentState!.formKey.currentState!.validate());
                  if (isValid1 && isValid2) {
                    controller.addList();
                  }
                  // setState(() {
                  //   groupBoxes.add(TextEditingController());
                  // });
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
