import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'chatScreen/presentation/chat_screen.dart';
import 'core/shared_widgets/localization_bottom.dart';
import 'core/shared_widgets/primary_button.dart';
import 'core/constants.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 150.h,
              right: 70.w,
              child: Image.asset('assets/images/halfchatbubble.png')),
          Positioned(
              top: 170.h,
              left: 60.w,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.black, fontSize: setResponsiveFontSize(30)),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Hi, My name is ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: setResponsiveFontSize(43))),
                    TextSpan(
                        text: 'Oranobot \n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: setResponsiveFontSize(45))),
                    TextSpan(
                        text:
                            'I will always be there to \nhelp and assist you.\n\nSay Start To go to Next.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: setResponsiveFontSize(43))),
                  ],
                ),
                textScaleFactor: 0.5,
              )),
          Positioned(
              bottom: 230.h,
              left: 80.w,
              child: Image.asset('assets/images/robot.png')),
          Positioned(
            bottom: 40.h,
            left: 0.w,
            right: 0.w,
            child: Column(
              children: [
                PrimaryButton(
                  height: 50,
                  width: 150,
                  text: 'Next',
                  onTap: () => navigateToPage(context,const ChatScreen()),
                ),
                SizedBox(
                  height: 60.h,
                ),
                const LocalizationBottom()
              ],
            ),
          )
        ],
      ),
    );
  }
}
