import 'package:bright_life_providers/ui/screens/registration/new_pass_screen.dart';
import 'package:bright_life_providers/ui/screens/registration/widgets/verification_text_field.dart';
import 'package:bright_life_providers/ui/widgets/blur_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../binding/base/nav_bar.dart';
import '../../../controllers/registration/verfication.dart';
import '../../../utils/base/colors.dart';
import '../../base/nav_bar.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text_circle_button.dart';

class VerificationAccountScreen extends StatefulWidget {
  final String phoneNumber;
  const VerificationAccountScreen({required this.phoneNumber, Key? key})
      : super(key: key);

  @override
  VerificationAccountScreenState createState() =>
      VerificationAccountScreenState();
}

class VerificationAccountScreenState extends State<VerificationAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<CodeField> codeFields = [
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var element in codeFields) {
      element.controller.dispose();
      element.focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              const BlurImage(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 33,
                    vertical: 33,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBackButton(),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Verification".tr,
                        style: const TextStyle(
                          fontSize: 51,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Account".tr,
                        style: const TextStyle(
                          fontSize: 51,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We send OTP code to your phone number Please enter it"
                            .tr,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Center(
                        child: SizedBox(
                          height: 49,
                          width: 276,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.ltr,
                            children: codeFields.map((element) {
                              return Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: VerificationTextField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(
                                          1,
                                        ),
                                      ],
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      focusNode: element.focusNode,
                                      controller: element.controller,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          element.focusNode.nextFocus();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // Center(
                      //   child: VerificationCode(
                      //     fullBorder: true,
                      //     textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor),
                      //     keyboardType: TextInputType.number,
                      //     underlineColor: MyColors.textFormFieldBorder,
                      //     length: 4,
                      //     cursorColor: Colors.blue,
                      //     onCompleted: (String value) {
                      //       FocusManager.instance.primaryFocus?.unfocus();
                      //       VerificationController.find.fetchVerificationData(
                      //         code: value,
                      //         context: context,
                      //       );
                      //     },
                      //     onEditing: (bool value) {
                      //       setState(() {});
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 48,
                        ),
                        child: Center(
                          child: GetBuilder<VerificationController>(
                            builder: (controller) {
                              return controller.counter.value != 0
                                  ? RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'didn\'t receive a code?'.tr,
                                            style: const TextStyle(
                                              color: MyColors.secondary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: MyColors.primary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'resend after'.tr,
                                            style: const TextStyle(
                                              color: MyColors.primary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ${controller.counter.value} ',
                                            style: const TextStyle(
                                              color: MyColors.primary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'seconds'.tr,
                                            style: const TextStyle(
                                              color: MyColors.primary,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'didn\'t receive a code?'.tr,
                                          style: const TextStyle(
                                            color: MyColors.secondary,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await controller.fetchData(
                                                phoneNum: widget.phoneNumber,
                                                context: context);
                                          },
                                          child: Text(
                                            'resend now'.tr,
                                            style: const TextStyle(
                                              color: MyColors.primary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                            },
                          ),
                        ),

                        // child: Center(
                        //   child: GetBuilder<VerificationController>(
                        //       builder: (controller) {
                        //     return RichText(
                        //       text: TextSpan(
                        //         text: "Didn't receive ?".tr,
                        //         style: const TextStyle(
                        //           color: MyColors.secondary,
                        //           fontSize: 16,
                        //         ),
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //             text:
                        //                 ' Resend in ${controller.counter.value}s',
                        //             style: const TextStyle(
                        //               color: MyColors.primary,
                        //               fontSize: 16,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   }),
                        // ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomTextCircleButton(
                        title: "Reset Password".tr,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String code = codeFields[0].controller.text +
                                codeFields[1].controller.text +
                                codeFields[2].controller.text +
                                codeFields[3].controller.text;
                            FocusManager.instance.primaryFocus?.unfocus();
                            ///TODO: bring back
                            Get.to(()=>NewPassScreen(phone:widget.phoneNumber));
                            // VerificationController.find.fetchVerificationData(
                            //     code: code, context: context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // });
  }
}

class CodeField {
  final TextEditingController controller;
  final FocusNode focusNode;

  CodeField({
    required this.focusNode,
    required this.controller,
  });
}
