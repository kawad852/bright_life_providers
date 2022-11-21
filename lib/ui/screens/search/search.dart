import 'package:bright_life_providers/binding/view_order_binding.dart';
import 'package:bright_life_providers/controllers/search/search.dart';
import 'package:bright_life_providers/ui/screens/order_details/order_details_screen.dart';
import 'package:bright_life_providers/ui/screens/search/widget/search_tile.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/base_shimmer_loading.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchCtrl());
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Search'.tr,
        withBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
              padding: const EdgeInsets.all(18.0),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 0, 20, 20),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                            itemCount:
                                SearchCtrl.find.model.value!.data!.length,
                            itemBuilder: (context, index) {
                              final data =
                                  SearchCtrl.find.model.value!.data![index];
                              return SearchTile(
                                image: data.image!,
                                title: data.name!,
                                description: data.description!,
                                location: data.location!,
                                rating: data.avgPoints!,
                                onTap: () {
                                  Get.to(
                                    OrderDetailsScreen(id: data.id!),
                                    binding: ViewOrderBinding(id: data.id!),
                                  );
                                },
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
