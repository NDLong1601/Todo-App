import 'package:flutter/material.dart';
import 'package:todo/components/app_textstyle.dart';

class AppText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final int maxLines;
  final TextStyle? style;

  const AppText({
    required this.title,
    this.textAlign,
    this.maxLines = 1,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? AppTextstyle.boldTsSize18Black,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
    );
  }
}
