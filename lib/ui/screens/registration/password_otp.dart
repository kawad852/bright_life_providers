
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:get/get.dart';

import '../../../controllers/registration/pass_otp_verfication.dart';
import '../../../utils/base/colors.dart';

class PasswordOTPScreen extends StatefulWidget {
  const PasswordOTPScreen({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  PasswordOTPScreenState createState() => PasswordOTPScreenState();
}

class PasswordOTPScreenState extends State<PasswordOTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    padding: EdgeInsets.only(bottom: 30, top: 50),
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
                      "We sent OTP code to your phone number Please enter it".tr.tr,
                    ),
                  ),
                  Center(
                    child: VerificationCode(
                      fullBorder: true,
                      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor),
                      keyboardType: TextInputType.number,
                      underlineColor: MyColors.textFormFieldBorder,
                      length: 4,
                      cursorColor: Colors.blue,
                      onCompleted: (String value) {
                        setState(() {
                          FocusManager.instance.primaryFocus?.unfocus();
                          PassOTPVerficationController.fetchPassOTPVerficationData(phoneNumber: widget.phoneNumber, code: value, context: context);
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t received ?'.tr,
                          style: const TextStyle(
                            color: MyColors.secondary,
                            fontSize: 16,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' Resend 59s',
                              style: TextStyle(
                                color: MyColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
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
