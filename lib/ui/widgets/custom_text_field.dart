import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final bool readOnly;
  final int maxLines;
  final Function()? onTap;
  final Widget? suffixIcon;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final bool filled;

  final InputDecoration? decoration;
  final int? maxLength;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.textDirection,
    this.keyboardType,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.suffixIcon,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
    this.decoration,
    this.maxLength,
    this.filled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      autovalidateMode: autoValidateMode,
      onTap: onTap,
      maxLines: maxLines,
      readOnly: readOnly,
      style: textStyle,
      keyboardType: keyboardType,
      textDirection: textDirection,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: filled,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
        label: label == null
            ? null
            : Text(
                label!,
                style: const TextStyle(
                  color: MyColors.text,
                ),
              ),
        hintText: hintText,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 20,
          minHeight: 20,
          maxWidth: 50,
          minWidth: 50,
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 43,
          minHeight: 43,
          maxWidth: 70,
          minWidth: 70,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromRGBO(39, 39, 49, 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.red868),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColors.red868),
        ),
        errorStyle: const TextStyle(color: MyColors.red868),
      ),
    );
  }
}
