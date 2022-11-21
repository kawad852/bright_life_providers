import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoading extends StatelessWidget {
  final double? height;
  final double? width;
  final double border;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CustomShimmerLoading({
    Key? key,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.border = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.primary,
      highlightColor: MyColors.greenFAA,
      child: Container(
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(border),
        ),
      ),
    );
  }
}
