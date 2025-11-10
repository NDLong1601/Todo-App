import 'package:flutter/material.dart';
import 'package:todo/components/app_button.dart';
import 'package:todo/components/app_text.dart';
import 'package:todo/components/app_textstyle.dart';
import 'package:todo/const/app_assets_path.dart';
import 'package:todo/const/app_color.dart';
import 'package:todo/screens/registration_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image(image: AssetImage(AppAssetsPath.imgShape)),
          ),
          SizedBox(height: 59),
          Image(
            image: AssetImage(AppAssetsPath.imgUndrawMobile),
          ),
          Padding(
            padding: EdgeInsets.only(left: 48, right: 46, top: 45),
            child: AppText(
              title: 'Gets things done with TODO',
              style: AppTextstyle.boldTsSize18Black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 48, right: 46, top: 36, bottom: 90),
            child: AppText(
              title:
                  'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Interdum \ndictum tempus, interdum at dignissim \nmetus. Ultricies sed nunc.',
              maxLines: 3,
              style: AppTextstyle.regularTsSize13Black,
            ),
          ),
          AppButton(
            text: 'Get Started',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegistrationScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
