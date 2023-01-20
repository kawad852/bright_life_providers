import 'package:bright_life_providers/ui/screens/wallet/widget/wallet_item.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'My Wallet'.tr,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        children: [
          WalletItem(
            title: 'No. Orders'.tr,
            value: '5735',
          ),
          WalletItem(
            title: 'Sales'.tr,
            value: '8342.4',
            withCurrency: true,
          ),
          WalletItem(
            title: 'Tax'.tr,
            value: '1203.2',
          ),
          WalletItem(
            title: 'Percentage'.tr,
            value: '753.30',
            percentage: '10%',
            withCurrency: true,
          ),
          WalletItem(
            title: 'Order Cancelled'.tr,
            value: '80',
            valueColor: MyColors.red303,
          ),
          WalletItem(
            title: 'Penalties'.tr,
            value: '200',
            titleColor: MyColors.green9AD,
            valueColor: MyColors.red303,
            withCurrency: true,
          ),
          WalletItem(
            title: 'Balance'.tr,
            value: '1687.43',
          ),
          WalletItem(
            title: 'Total recipient'.tr,
            value: '6049.34',
            titleColor: MyColors.green9AD,
            withCurrency: true,
          ),
        ],
      ),
    );
  }
}
