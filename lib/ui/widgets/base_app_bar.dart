import 'package:bright_life_providers/ui/widgets/custom_back_button.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withBackButton;
  const BaseAppBar({
    Key? key,
    required this.title,
    this.withBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: MyColors.text, fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: withBackButton
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomBackButton(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
