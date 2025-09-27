import 'package:contacts/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContactData extends StatelessWidget {
  final TextEditingController customController;
  final String customText;
  const CustomContactData({
    super.key,
    required this.customController,
    required this.customText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      customController.text.isNotEmpty ? customController.text : customText,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.gold,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
