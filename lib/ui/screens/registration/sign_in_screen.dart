import 'package:bright_life_providers/controllers/registration/sign_in_ctrl.dart';
import 'package:bright_life_providers/ui/widgets/blur_image.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_circle_button.dart';
import 'package:bright_life_providers/ui/widgets/custom_text_field.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController signInCtrl;
  late TextEditingController passwordCtrl;

  @override
  void initState() {
    signInCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    signInCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          const BlurImage(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome\nBack".tr,
                    style: const TextStyle(
                      fontSize: 51,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: CustomTextField(
                      controller: signInCtrl,
                      hintText: 'Email address or phone Number'.tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your email'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomTextField(
                    controller: passwordCtrl,
                    hintText: 'Password'.tr,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password'.tr;
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?".tr,
                        style: const TextStyle(color: MyColors.text),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextCircleButton(
                    title: "Sign in".tr,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        SignInCtrl.fetchSignInData(
                          email: signInCtrl.text,
                          password: passwordCtrl.text,
                          context: context,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
