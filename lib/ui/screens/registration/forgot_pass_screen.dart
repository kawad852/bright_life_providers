import 'package:bright_life_providers/ui/screens/registration/widgets/phone_pre_fix.dart';
import 'package:bright_life_providers/ui/widgets/blur_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/registration/forgot_pass_ctrl.dart';
import '../../../utils/base/colors.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text_circle_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  late TextEditingController phoneCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: const BaseAppBar(title: ''),
      body: Stack(
        children: [
          const BlurImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomBackButton( function: () {
                         Get.back();
                       },),
                      const SizedBox(
                        height: 25,
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional.centerEnd,
                      //   child: Image.asset(
                      //     MyImages.gradient,
                      //     height: 200,
                      //   ),
                      // ),
                      Text(
                        "Forget\nPassword ?".tr,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Enter your phone number to reset Password".tr,
                        ),
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: phoneCtrl,
                        prefixIcon: const PhonePreFix(),
                        hintText: 'start from 7'.tr,
                        hintStyle: const TextStyle(color: MyColors.hintText),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your phone number".tr;
                          } else if (value.length != 9) {
                            return "Enter correct phone number".tr;
                          }
                          return null;
                        },
                        label: 'Phone Number'.tr,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(9),
                        ],
                      ),
                      const SizedBox(height: 50),
                      CustomTextCircleButton(
                        title: '',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            ForgotPassCtrl.fetchData(
                                phoneNum: phoneCtrl.text, context: context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
