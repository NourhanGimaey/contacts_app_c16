import 'package:contacts/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController customController;
  final String customHintText;
  final TextInputType customKeyboardType;
  final TextInputAction customTextInputAction;

  const CustomTextField({
    super.key,
    required this.customController,
    required this.customHintText,
    required this.customKeyboardType,
    required this.customTextInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: customController,
      textInputAction: customTextInputAction,
      keyboardType: customKeyboardType,
      style: TextStyle(fontSize: 16, color: AppColors.gold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        hintText: customHintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.lightBlue,
          fontWeight: FontWeight.w500,
        ),
      ),
      cursorColor: AppColors.gold,
      cursorRadius: Radius.circular(16),
    );
  }
}
