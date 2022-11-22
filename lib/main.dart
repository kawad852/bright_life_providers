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
  // MySharedPreferences.accessToken =
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2FiNmRkZWY1NTQ2NTZmMTg4Y2JlYWRjYjY5NmUwZTc4NGE0MjE5ZmI2NWE2ODA3YWQ3MTA1MmQyMjkzMTFkYjk2ZGY3NDFhN2Y1NmY4OWYiLCJpYXQiOjE2Njg4NjkyMTAuMzEwMDAyMDg4NTQ2NzUyOTI5Njg3NSwibmJmIjoxNjY4ODY5MjEwLjMxMDAwMzA0MjIyMTA2OTMzNTkzNzUsImV4cCI6MTcwMDQwNTIxMC4zMDcxOTM5OTQ1MjIwOTQ3MjY1NjI1LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.NG6Q14Hufz7s-I212mubjKYAKoG0mQIr7RPcshxqwH0i-qF9YzxFTthMeaEL13mPMPecp8aVHHlq_ppmLUX-tPb1dTajilP12aLMEW7QKonwaI0p4azA2u1o75favslMsr2N6A2-oj_uBziwnpDWIwKtfYvQjwgunQhtKwtIo6nUjJsavhyuA4tnvmXtp8BDMPoW0eQk6kthWBVrQ5lsSwFczCDCMjFDe5L7m1_89fKOLZybEaFqYSocwGCkxjv7apI2qzOHMutARfojMM6hafc4HxB3g1A9xW8TfXReb7nZRIzDu_3n4qIjMgWe9fTnOr6ZgilEqa8og6H-nCzdEw98DCGiqCOdYxzc_LihZQIoLv2QS6nkPsuQqXTYC3w-NNZyg04JWaCHQnEEu3JfphbYEIq2oGm19JqGQPXi0_HbTmt9eAf_3ok663rGhysd_Qb0PjNtBNZRSpFKH_wxuil32I53SUvBYILDVYSZ_yU46HpPbOUFtWncYfb43oKq-bo_pBz-DIh-AEBqRSj0yVtZp45edWhFahDVXtHMcWt_RUFg4KfOf7zL2gk1hZbhqJCNnsAU9b-QBAVVPgH7F6-aQTnawAV8smcEC2DHVz3CRowCGIU2KeVDyYRTbyBnPavRxsa8fneVj6mj9T_kyhsaA9Wn43y4LbF8xLCgrG4';
  // MySharedPreferences.isLogIn = true;
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
  Widget _toggleScreen() {
    if (MySharedPreferences.isLogIn) {
      return const BaseNavBar();
    } else {
      return const SignInScreen();
    }
  }

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
      initialBinding: NavBarBinding(),
    );
  }
}
