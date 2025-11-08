import 'package:flutter/material.dart';
import 'package:todo/const/app_color.dart';

class AppTexfield extends StatefulWidget {
  final String hintText;
  final TextStyle? style;

  const AppTexfield({
    required this.hintText,
    this.style,
    super.key,
  });

  @override
  State<AppTexfield> createState() => _AppTexfieldState();
}

class _AppTexfieldState extends State<AppTexfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: widget.style,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
    );
  }
}
