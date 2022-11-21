import 'package:bright_life_providers/ui/widgets/custom_shimmer_loading.dart';
import 'package:flutter/material.dart';

class BaseShimmerLoading extends StatelessWidget {
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;

  const BaseShimmerLoading({
    Key? key,
    this.shrinkWrap = false,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      shrinkWrap: true,
      padding: padding,
      itemCount: 12,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomShimmerLoading(
              height: 80,
              width: 80,
              border: 10,
              margin: EdgeInsetsDirectional.only(end: 10),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Column(
                  children: const [
                    CustomShimmerLoading(
                      height: 16,
                      width: double.infinity,
                      border: 10,
                      margin: EdgeInsetsDirectional.only(end: 20, bottom: 10),
                    ),
                    CustomShimmerLoading(
                      height: 16,
                      width: double.infinity,
                      border: 10,
                      margin: EdgeInsetsDirectional.only(end: 50, bottom: 10),
                    ),
                    CustomShimmerLoading(
                      height: 16,
                      width: double.infinity,
                      border: 10,
                      margin: EdgeInsetsDirectional.only(end: 80),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
