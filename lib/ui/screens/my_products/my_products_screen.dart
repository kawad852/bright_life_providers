import 'package:bright_life_providers/controllers/my_product/my_product_ctrl.dart';
import 'package:bright_life_providers/models/my_products/my_products_model.dart';
import 'package:bright_life_providers/ui/screens/my_products/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base_app_bar.dart';
import '../../widgets/failed_widget.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = MyProductsCtrl.find;
    return Scaffold(
      appBar: BaseAppBar(
        title: 'my products / services'.tr,
        withBackButton: true,
        function: () {
          Get.back();
        },
      ),
      body: FutureBuilder<MyProductsModel?>(
          future: ctrl.initialize,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
              default:
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    separatorBuilder: (context,index){
                      return const SizedBox(height: 15,);
                    },
                    itemCount: ctrl.model?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = snapshot.data?.data?[index];
                      return MaintenanceListItem(
                        title: data?.name ?? '',
                        description: data?.name ?? '',
                        image: data?.image ?? '',
                        price: double.parse(data?.price ?? '0.0'),
                        onTap: () {},
                        id: data?.id ?? 0,
                      );
                    },
                  );
                } else {
                  return const FailedWidget();
                }

            }
          }),
    );
  }
}
