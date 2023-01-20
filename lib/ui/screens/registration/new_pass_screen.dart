
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/registration/change_password.dart';
import 'widgets/password_appearance_widget.dart';
import '../../widgets/custom_text_circle_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../../utils/base/images.dart';

class NewPassScreen extends StatefulWidget {
  final String phone;

  const NewPassScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  late TextEditingController passwordCtrl;
  late TextEditingController confirmPasswordCtrl;
  bool isPassObscure = true;
  bool isConfirmPassObscure = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordCtrl = TextEditingController();
    confirmPasswordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(title: ''),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Image.asset(
                  MyImages.gradient,
                  height: 200,
                ),
              ),
              Text(
                "New\nPassword".tr,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Enter new password".tr,
                ),
              ),
              CustomTextField(
                suffixIcon: PasswordAppearanceWidget(
                  onTap: () {
                    setState(() {
                      isPassObscure = !isPassObscure;
                    });
                  },
                  obscureText: isPassObscure,
                ),
                obscureText: isPassObscure,
                controller: passwordCtrl,
                label: "Password".tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password".tr;
                  }
                  if (value.length < 4) {
                    return "password is short".tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              CustomTextField(
                suffixIcon: PasswordAppearanceWidget(
                  onTap: () {
                    setState(() {
                      isConfirmPassObscure = !isConfirmPassObscure;
                    });
                  },
                  obscureText: isConfirmPassObscure,
                ),
                obscureText: isConfirmPassObscure,
                controller: confirmPasswordCtrl,
                label: "Confirm Password".tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password".tr;
                  }
                  if (value != passwordCtrl.text) {
                    return "Does'nt match".tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              CustomTextCircleButton(
                title: '',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ChangePasswordCtrl.fetchPasswordResetData(
                      phoneNumber: widget.phone,
                      password: passwordCtrl.text.trim(),
                      context: context,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
