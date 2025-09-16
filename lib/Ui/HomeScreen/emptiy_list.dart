import 'package:contact/Utils/app_colors.dart';
import 'package:contact/Utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptiyList extends StatelessWidget {
  const EmptiyList({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animation/empty_list.json",
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "There is No Contacts Added Here",
              style: AppTextStyle.w500LGold16,
            ),
          ),
        ],
      ),
    );
  }
}
