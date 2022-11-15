import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(
          color: MyColors.text,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: SvgPicture.asset(icon),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_forward_ios,
          size: 13,
          color: MyColors.text,
        ),
      ),
    );
  }
}
