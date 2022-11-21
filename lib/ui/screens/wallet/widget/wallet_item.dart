import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class WalletItem extends StatelessWidget {
  final bool withCurrency;
  final String? percentage;
  final String title, value;
  final Color titleColor, valueColor;

  const WalletItem(
      {Key? key,
      required this.title,
      required this.value,
      this.titleColor = MyColors.textBlack,
      this.valueColor = MyColors.green9AD,
      this.percentage,
      this.withCurrency = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: 170,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MyColors.green9F2,
        borderRadius: BorderRadius.all(
          Radius.circular(35),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          percentage == null
              ? Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 22,
                  ),
                )
              : RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: 'B',
                    style: const TextStyle(
                      color: MyColors.green9AD,
                      fontSize: 22,
                    ),
                    children: <TextSpan>[
                       const TextSpan(
                        text: 'R ',
                        style: TextStyle(
                          color: MyColors.greenFAA,
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: title,
                        style: const TextStyle(
                          color: MyColors.textBlack,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                ),
          percentage != null
              ? Text(
                  percentage!,
                  style: const TextStyle(
                    color: MyColors.textBlack,
                    fontSize: 22,
                  ),
                )
              : const SizedBox(
                  height: 25,
                ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: valueColor, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          withCurrency
              ? const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'JOD',
                    style: TextStyle(
                      color: MyColors.textBlack,
                      fontSize: 22,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 40,
                ),
        ],
      ),
    );
  }
}
