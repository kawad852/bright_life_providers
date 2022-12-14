import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final kTypeDropDownDecoration = InputDecoration(
  filled: true,
  fillColor: MyColors.white,
  isDense: true,
  hintText: 'Select Category'.tr,
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
);

final kBubbleDropDownDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(8.0),
  hintText: 'Category'.tr,
  isDense: true,
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: MyColors.textFormFieldBorder),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: MyColors.textFormFieldBorder),
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
);
