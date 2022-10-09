import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class CustomLoader {
  static show(BuildContext context) {
    Loader.show(
      context,
      overlayColor: Colors.black26,
      progressIndicator: const CircularProgressIndicator(
        color: MyColors.green9AD,
      ),
    );
  }
}
