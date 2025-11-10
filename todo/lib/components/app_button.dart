import 'package:flutter/material.dart';
import 'package:todo/components/app_text.dart';
import 'package:todo/components/app_textstyle.dart';
import 'package:todo/const/app_color.dart';

class AppButton extends StatelessWidget {
  final String text;

  /// Nullable onPressed callback
  final Function()? onPressed;

  const AppButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minimumSize: Size(325, 62),
      ),
      child: AppText(
        title: text,
        style: AppTextstyle.boldTsSize18Black.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
