import 'package:bright_life_providers/controllers/search/search.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/base_shimmer_loading.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../home/widgets/order_bubble.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    Get.put(SearchCtrl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Search'.tr,
        withBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Find the order you want'.tr,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                18.0,
              ),
              child: CustomTextField(
                fillColor: MyColors.greenFD4,
                borderColor: MyColors.greenFD4,
                filled: true,
                label: 'Search in orders.'.tr,
                prefixIcon: SvgPicture.asset(
                  MyIcons.search2,
                  fit: BoxFit.scaleDown,
                ),
                onChanged: (value) {
                  if (SearchCtrl.find.searchQuery.value != value) {
                    SearchCtrl.find.onSearchChanged(value);
                  }
                },
              ),
            ),
            Obx(
              () => SearchCtrl.find.searchQuery.isEmpty
                  ? const SizedBox.shrink()
                  : SearchCtrl.find.isLoading.value
                      ? const Expanded(
                          child: BaseShimmerLoading(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              20,
                              0,
                              20,
                              20,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              20,
                              0,
                              20,
                              20,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 0,
                            ),
                            itemCount:
                                SearchCtrl.find.model.value?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final data = SearchCtrl.find.model.value!.data!;
                              return OrderBubble(
                                orderNum: '#${data[index]?.number}',
                                status: data[index]?.status ?? '',
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
