import 'package:bright_life_providers/controllers/home/filter_ctrl.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/filter_list_tile.dart';
import 'package:bright_life_providers/ui/widgets/custom_fab_button.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrdersFilterWidget extends StatelessWidget {
  OrdersFilterWidget({Key? key}) : super(key: key);
  final filterController = Get.find<FilterController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Orders",
            style: TextStyle(fontSize: 22),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
                context: context,
                builder: (context) {
                  return SizedBox(
                        height: Get.height*0.75,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                          child: Column(
                            children: [
                              Text(
                                'Filter Date'.tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              DateListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeDateFilter(
                                         value!,'Today');
                                  },
                                  title: 'Today',),
                              DateListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeDateFilter(
                                    value!, 'This Week');
                                  },
                                  title: 'This Week'),
                              DateListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeDateFilter(
                                    value!,'This Month');
                                  },
                                  title: 'This Month'),
                              DateListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeDateFilter(
                                        value!,'Last 3 Month');
                                  },
                                  title: 'Last 3 Month'),
                              DateListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeDateFilter(
                                        value!,'This Year');
                                  },
                                  title: 'This Year'),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0,top: 15),
                                child: Text(
                                  'Order Status'.tr,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              StatusListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeStatusFilter(
                                        'Pending', value!);
                                  },
                                  title: 'Pending'),
                              StatusListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeStatusFilter(
                                        'In progress', value!);
                                  },
                                  title: 'In progress'),
                              StatusListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeStatusFilter(
                                        'Completed', value!);
                                  },
                                  title: 'Completed'),
                              StatusListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeStatusFilter(
                                        'Canceled', value!);
                                  },
                                  title: 'Canceled'),
                              StatusListTile(
                                  onChanged: (bool? value) {
                                    filterController.changeStatusFilter(
                                        'On Delivery', value!);
                                  },
                                  title: 'On Delivery'),
                              const Spacer(flex: 1,),
                              CustomFABButton(title: 'Filtering', onPressed: (){
                                filterController.filter();
                                Navigator.pop(context);
                              })

                            ],
                          ),
                        ),
                      );
                },
              );
            },
            child: SvgPicture.asset(MyIcons.filter),
          ),
        ],
      ),
    );
  }
}
