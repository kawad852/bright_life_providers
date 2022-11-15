import 'package:bright_life_providers/ui/screens/profile/widget/custom_listtile.dart';
import 'package:bright_life_providers/ui/screens/profile/widget/help_button.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_network_image.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum Languages { english, arabic }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static Future<void> _showLanguageDialog(BuildContext context) async {
    showDialog<Languages>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Language'.tr),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('English'.tr),
              onPressed: () {
                Get.back();
                if (MySharedPreferences.language == "en") return;
                MySharedPreferences.language = "en";
                Get.updateLocale(Locale(MySharedPreferences.language));
              },
            ),
            SimpleDialogOption(
              child: Text('Arabic'.tr),
              onPressed: () {
                Get.back();
                if (MySharedPreferences.language == "ar") return;
                MySharedPreferences.language = "ar";
                Get.updateLocale(Locale(MySharedPreferences.language));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Profile'.tr,
        withBackButton: false,
      ),
      floatingActionButton: const HelpButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(35, 10, 35, 50),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                margin: const EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: MyColors.green9F2,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      'Green DryClean',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          '0780190006',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.secondary,
                          ),
                        ),
                      ),
                    ),
                    CustomListTile(
                      icon: MyIcons.add,
                      title: 'Add Product / Service'.tr,
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: MyIcons.wallet,
                      title: 'My Wallet'.tr,
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        MySharedPreferences.language == "ar"
                            ? 'English Language'.tr
                            : 'Arabic Language'.tr,
                        style: const TextStyle(
                          color: MyColors.text,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: SvgPicture.asset(MyIcons.shuffle),
                      onTap: () {
                        setState(() {
                          if (MySharedPreferences.language == "ar") {
                            MySharedPreferences.language = "en";
                            Get.updateLocale(
                                Locale(MySharedPreferences.language));
                          } else {
                            MySharedPreferences.language = "ar";
                            Get.updateLocale(
                                Locale(MySharedPreferences.language));
                          }
                        });
                      },
                    ),
                    CustomListTile(
                      icon: MyIcons.policy,
                      title: 'Privacy Policy'.tr,
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: MyIcons.info,
                      title: 'About App'.tr,
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: MyIcons.signInOut,
                      title: MySharedPreferences.isLogIn == true
                          ? 'Logout'.tr
                          : 'Login'.tr,
                      onTap: () {
                        // Get.offAll(() => const SignInScreen());
                        // MySharedPreferences.clearProfile();
                        // SignOutController.fetchSignOutData(context: context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            CustomNetworkImage(
              url: MySharedPreferences.userImage,
              border: 200,
              width: 125,
              height: 125,
            ),
          ],
        ),
      ),
    );
  }
}
