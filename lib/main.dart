import 'package:bright_life_providers/binding/base/nav_bar.dart';
import 'package:bright_life_providers/translation/translation.dart';
import 'package:bright_life_providers/ui/base/nav_bar.dart';
import 'package:bright_life_providers/ui/screens/registration/sign_in_screen.dart';
import 'package:bright_life_providers/utils/material_theme.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:get/get.dart';

import 'binding/registration_binding.dart';

//khaled basem awad .. my saved project // ...
// dddtt

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: "XXX",
      //   appId: "XXX",
      //   messagingSenderId: "XXX",
      //   projectId: "XXX",
      // ),
      );
  await MySharedPreferences.init();
  //TODO: change later
  MySharedPreferences.isPassedIntro = true;
  if (MySharedPreferences.language.isEmpty) {
    MySharedPreferences.language = Get.deviceLocale!.languageCode;
  }
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _toggleScreen() {
    if (MySharedPreferences.isLogIn) {
      return const BaseNavBar();
    } else {
      return const SignInScreen();
    }
  }

  Bindings? _initialBinding() {
    if (MySharedPreferences.isLogIn) {
      return NavBarBinding();
    } else {
      return RegistrationBinding();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'JO'),
      ],
      locale: Locale(MySharedPreferences.language),
      fallbackLocale: Locale(MySharedPreferences.language),
      theme: AppThemeData().materialTheme,
      home: _toggleScreen(),
      // home: TimerTest(),
      initialBinding: _initialBinding(),
    );
  }
}
