import 'package:flutter/material.dart';
import 'package:todo/const/app_color.dart';

class AppTextstyle {
  /// Regular -> 400
  /// Medium -> 500
  /// Bold -> 600
  /// Semi-Bold -> 700

  static TextStyle boldTsSize18Black = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black.withValues(alpha: 0.75),
  );

  static TextStyle regularTsSize13Black = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withValues(alpha: 0.74),
  );

  static TextStyle semiBoldTsSize14Black = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.black.withValues(alpha: 0.75),
  );

  static TextStyle regularTsSize14Black = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withValues(alpha: 0.75),
  );
}
