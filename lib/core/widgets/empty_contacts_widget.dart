import 'package:contacts/core/utils/app_assets.dart';
import 'package:contacts/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyContactsWidget extends StatelessWidget {
  const EmptyContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          LottieBuilder.asset(AppImages.contactsList),
          Text(
            'There are no contacts added here',
            style: TextStyle(color: AppColors.gold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
