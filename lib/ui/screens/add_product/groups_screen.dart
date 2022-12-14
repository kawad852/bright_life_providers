import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/group_bubble.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class GroupsScreen extends StatefulWidget {
  final String type;
  const GroupsScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'.tr),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'.tr),
              onPressed: () {
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
            _showDialog(AppConstants.groupsAlertMessageLeavingPage);
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
                _showDialog(AppConstants.groupsAlertMessageAddGroup);
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              RequiredGroupsCtrl.find.validate(
                validAction: () {
                  Get.back();
                  if (RequiredGroupsCtrl.find.groups.isNotEmpty) {
                    Fluttertoast.showToast(msg: 'Changes saved'.tr);
                  }
                },
                nonValidAction: () {
                  _showDialog(AppConstants.groupsAlertMessageLeavingPage);
                },
              );
            },
          ),
          title: Text("Add groups".tr),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  RequiredGroupsCtrl.find.validate(
                    validAction: () {
                      Get.back();
                      if (RequiredGroupsCtrl.find.groups.isNotEmpty) {
                        Fluttertoast.showToast(msg: 'Changes saved'.tr);
                      }
                    },
                    nonValidAction: () {
                      _showDialog(AppConstants.groupsAlertMessageSave);
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
            if (controller.groups.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Click on the + button to add a group".tr,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
              itemCount: controller.groups.length,
              itemBuilder: (context, index) {
                final data = controller.groups[index];
                return GroupBubble(
                  key: controller.bubbleKeys[index],
                  index: index,
                  title: data.name,
                  type: data.type,
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
