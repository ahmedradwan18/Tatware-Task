import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'core/color_manager.dart';
import 'core/constants.dart';
import 'start_screen.dart';
import 'core/shared_widgets/localization_bottom.dart';
import 'core/shared_widgets/primary_button.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover)),
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
                top: size.height / 2.4,
                left: 0.w,
                right: 0.w,
                child: Image.asset('assets/images/title.png')),
            Positioned(
              bottom: 40.h,
              left: 0.w,
              right: 0.w,
              child: Column(
                children: [
                  PrimaryButton(
                    height: 50,
                    width: 330,
                    text: 'Get Started',
                    onTap: () => navigateToPage(context,const StartScreen()),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: setResponsiveFontSize(30)),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: 'SignUp',
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const LocalizationBottom()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

