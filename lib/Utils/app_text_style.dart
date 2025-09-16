import 'package:contact/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle w500Gold20 = GoogleFonts.inter(
    color: AppColors.gold,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle w400Gold16 = GoogleFonts.inter(
    color: AppColors.gold,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle w400LightBlue16 = GoogleFonts.inter(
    color: AppColors.lightBlue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle w500LGold16 = GoogleFonts.inter(
    color: AppColors.gold,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle w500DarkBlue10 = GoogleFonts.inter(
    color: AppColors.darkBlue,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle w500DarkBlue14 = GoogleFonts.inter(
    color: AppColors.darkBlue,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
