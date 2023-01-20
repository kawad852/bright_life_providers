
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/registration/change_password.dart';
import '../../widgets/custom_text_field.dart';

class PasswordResettingScreen extends StatefulWidget {
  const PasswordResettingScreen({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<PasswordResettingScreen> createState() => _PasswordResettingScreenState();
}

class _PasswordResettingScreenState extends State<PasswordResettingScreen> {
  late TextEditingController confirmPasswordCtrl;
  late TextEditingController passwordCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirmPassword() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

  @override
  void initState() {
    confirmPasswordCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    confirmPasswordCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Icon(
                      Icons.lock,
                      size: 80,
                    ),
                  ),
                  Text(
                    "Reset your password".tr,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Enter your new password".tr,
                    ),
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglePassword();
                      },
                      child: _obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    ),
                    obscureText: _obscureText,
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _toggleConfirmPassword();
                      },
                      child: _obscureConfirmText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    ),
                    obscureText: _obscureConfirmText,
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
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ChangePasswordCtrl.fetchPasswordResetData(phoneNumber: widget.phoneNumber, password: passwordCtrl.text.trim(), context: context);
                      }
                    },
                    child: Text(
                      "Set".tr,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
