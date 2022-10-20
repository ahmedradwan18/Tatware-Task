import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40.h,
          width: 50.w,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/manavatar.png',
                ),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Image.asset(
          'assets/images/appbartitle.png',
          height: 60.h,
        ),
        Image.asset(
          'assets/images/Search.png',
          height: 50.h,
        )
      ],
    );
  }
}
