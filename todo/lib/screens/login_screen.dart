import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/app_button.dart';
import 'package:todo/components/app_texfield.dart';
import 'package:todo/components/app_text.dart';
import 'package:todo/components/app_textstyle.dart';
import 'package:todo/const/app_assets_path.dart';
import 'package:todo/const/app_color.dart';
import 'package:todo/screens/dashboard_screen.dart';
import 'package:todo/screens/registration_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(AppAssetsPath.imgShape),
            ),
            SizedBox(height: 35),
            AppText(
              title: 'Welcome Back!',
              style: AppTextstyle.boldTsSize18Black,
            ),
            SizedBox(height: 35),
            DottedBorder(
                dashPattern: [8, 5],
                strokeWidth: 2,
                borderType: BorderType.Rect,
                color: AppColors.lightGray,
                child: Image.asset(AppAssetsPath.imgSlice2)),
            Padding(
                padding: const EdgeInsets.only(left: 27, right: 23, top: 21),
                child: AppTexfield(hintText: 'Enter your email')),
            Padding(
              padding: const EdgeInsets.only(
                  left: 27, right: 23, top: 21, bottom: 25),
              child: AppTexfield(hintText: 'Enter your password'),
            ),
            AppText(
                title: "Forgot Password?",
                style: AppTextstyle.regularTsSize16lightBlue),
            SizedBox(height: 24),
            AppButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (context) => DashboardScreen()),
                );
              },
            ),
            SizedBox(height: 29),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account?",
                    style: AppTextstyle.regularTsSize14Black,
                  ),
                  TextSpan(
                    text: "  Sign up",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pop(
                          MaterialPageRoute<void>(
                              builder: (context) => RegistrationScreen()),
                        );
                      },
                    style: AppTextstyle.semiBoldTsSize14Black.copyWith(
                      color: AppColors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
