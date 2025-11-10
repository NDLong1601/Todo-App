import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/app_button.dart';
import 'package:todo/components/app_texfield.dart';
import 'package:todo/components/app_text.dart';
import 'package:todo/components/app_textstyle.dart';
import 'package:todo/const/app_assets_path.dart';
import 'package:todo/const/app_color.dart';
import 'package:todo/screens/dashboard_screen.dart';
import 'package:todo/screens/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
            SizedBox(height: 76),
            AppText(
              title: 'Welcome Onboard!',
              style: AppTextstyle.boldTsSize18Black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 69, right: 65, top: 14),
              child: AppText(
                title: 'Let’s help you meet up your tasks',
                style: AppTextstyle.regularTsSize13Black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 23, top: 49),
              child: AppTexfield(hintText: 'Enter your full name'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 23, top: 21),
              child: AppTexfield(hintText: 'Enter your email'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 23, top: 21),
              child: AppTexfield(hintText: 'Enter your password'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 27, right: 23, top: 21, bottom: 40),
              child: AppTexfield(hintText: 'Confirm your password'),
            ),
            AppButton(
              text: 'Register',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (context) => DashboardScreen()),
                );
              },
            ),
            SizedBox(height: 23),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account ?",
                    style: AppTextstyle.regularTsSize14Black,
                  ),
                  TextSpan(
                    text: "  Sign In",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (context) => SignInScreen()),
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
