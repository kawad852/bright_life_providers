import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WalletLoading extends StatelessWidget {
  const WalletLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        children: List.generate(
          8,
          (index) => Shimmer.fromColors(
            baseColor: MyColors.primary,
            highlightColor: MyColors.greenFAA,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
              ),
            ),
          ),
        ));
  }
}
