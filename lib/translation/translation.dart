import 'package:bright_life_providers/translation/arabic.dart';
import 'package:bright_life_providers/translation/english.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
