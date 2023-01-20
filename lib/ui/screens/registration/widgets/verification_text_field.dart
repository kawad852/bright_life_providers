import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/base/colors.dart';

class VerificationTextField extends StatelessWidget {
  final String? initialValue;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

  const VerificationTextField({
    Key? key,
    this.initialValue,
    this.prefixIcon,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textAlign,
    this.style,
    this.inputFormatters,
  }) : super(key: key);

  static const _border = 9.0;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: false,
      style: style,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textDirection: TextDirection.ltr,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: false,
        fillColor: MyColors.grey4F9,
        prefixIcon: prefixIcon,
        // prefixIconConstraints: const BoxConstraints(
        //   maxHeight: 70,
        //   minWidth: 50,
        //   maxWidth: 50,
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_border),
          borderSide:  const BorderSide(
            color: MyColors.greyEB3,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_border),
          borderSide: const BorderSide(
            color: MyColors.greyEB3,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_border),
          borderSide:const BorderSide(
            color: MyColors.greyEB3,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_border),
          borderSide: const BorderSide(
            color: MyColors.greyEB3,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_border),
          borderSide: const BorderSide(
            color: MyColors.greyEB3,
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(color: Color(0xFFD74545)),
      ),
    );
  }
}
