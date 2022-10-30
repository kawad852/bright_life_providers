import 'package:bright_life_providers/translation/translation.dart';
import 'package:bright_life_providers/ui/screens/home/home_screen.dart';
import 'package:bright_life_providers/utils/material_theme.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//khaled basem awad .. my saved project // ...

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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Widget _toggleScreen() {
  //   if (MySharedPreferences.isLogIn) {
  //     return const BaseNavBar();
  //   } else if (!MySharedPreferences.isLogIn && !MySharedPreferences.isPassedIntro) {
  //     return const IntroScreen();
  //   } else {
  //     return const SignInScreen();
  //   }
  // }
  //
  // Bindings? _initialBinding() {
  //   //TODO: test later
  //   if (MySharedPreferences.isLogIn) {
  //     return NavBarBinding();
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: _initialBinding(),
      translations: Translation(),
      // localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('ar', 'JO'),
      // ],
      locale: Locale(MySharedPreferences.language),
      fallbackLocale: Locale(MySharedPreferences.language),
      theme: AppThemeData().materialTheme,
      home: const HomeScreen(),
    );
  }
}
