import 'package:bright_life_providers/binding/create_order_binding.dart';
import 'package:bright_life_providers/controllers/registration/sign_out_ctrl.dart';
import 'package:bright_life_providers/ui/screens/add_product/create_product_screen.dart';
import 'package:bright_life_providers/ui/screens/profile/widget/custom_listtile.dart';
import 'package:bright_life_providers/ui/screens/wallet/wallet.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_network_image.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/base/icons.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final createProductKey = GlobalKey<CreateProductScreenState>();

enum Languages { english, arabic }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Profile'.tr,
        withBackButton: false,
      ),
      // floatingActionButton: const HelpButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          35,
          10,
          35,
          50,
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      10,
                      70,
                      10,
                      10,
                    ),
                    margin: const EdgeInsets.only(
                      top: 70,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        29,
                      ),
                      color: MyColors.green9F2,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '${MySharedPreferences.fName} ${MySharedPreferences.lName}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: MyColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              MySharedPreferences.userNumber,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: MyColors.secondary,
                              ),
                            ),
                          ),
                        ),
                        CustomListTile(
                          icon: MyIcons.add,
                          title: 'Add Product / Service'.tr,
                          onTap: () {
                            Get.to(
                              () => CreateProductScreen(key: createProductKey),
                              binding: CreateProductBinding(),
                            );
                          },
                        ),
                        CustomListTile(
                          icon: MyIcons.wallet,
                          title: 'My Wallet'.tr,
                          onTap: () {
                            Get.to(() => const WalletScreen());
                          },
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
                          leading: SvgPicture.asset(
                            MyIcons.shuffle,
                          ),
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
                            SignOutController.fetchSignOutData(
                                context: context);
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
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 72,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: const Color(
                    0xffC4DFAA,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      MyIcons.lifeRing,
                      color: Colors.white,
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      'do you need help?'.tr,
                      style: const TextStyle(
                        color: MyColors.black333,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
