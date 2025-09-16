import 'package:contact/Utils/app_colors.dart';
import 'package:contact/Utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.hintTextStyle,
    required this.keyboardType,
  });
  final String hintText;
  final TextStyle hintTextStyle;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return TextFormField(
      style: AppTextStyle.w500LGold16,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        hintText: hintText,
        hintStyle: hintTextStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
