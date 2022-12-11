import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_product_bubble.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RequiredGroupsScreen extends StatefulWidget {
  final String type;
  const RequiredGroupsScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<RequiredGroupsScreen> createState() => _RequiredGroupsScreenState();
}

class _RequiredGroupsScreenState extends State<RequiredGroupsScreen> {
  Future<void> _saveChanges() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('Would you like to approve of this message?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                RequiredGroupsCtrl.find.removeNonValidGroup();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        bool? willPop;
        RequiredGroupsCtrl.find.validate(
          validAction: () {
            willPop = true;
          },
          nonValidAction: () {
            willPop = false;
          },
        );
        return Future.value(willPop);
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: 'aaaaa',
          onPressed: () {
            RequiredGroupsCtrl.find.validate(
              validAction: () {
                RequiredGroupsCtrl.find.addGroup();
              },
              nonValidAction: () {
                return;
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: const BackButton(),
          title: Text("required"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  RequiredGroupsCtrl.find.validate(
                    validAction: () {
                      Get.back();
                      Fluttertoast.showToast(msg: 'Changes saved'.tr);
                    },
                    nonValidAction: () {
                      _saveChanges();
                    },
                  );
                },
                child: Text(
                  "Save".tr,
                  style: const TextStyle(color: MyColors.white, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<RequiredGroupsCtrl>(
          builder: (controller) {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.groups.length,
              itemBuilder: (context, index) {
                final data = controller.groups[index];
                return RequiredProductBubble(
                  key: controller.bubbleKeys[index],
                  index: index,
                  title: data.name,
                  length: controller.groups.length,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
