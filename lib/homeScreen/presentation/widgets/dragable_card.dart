import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/color_manager.dart';

class DraggableCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const DraggableCard({

    required this.image,
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.5.w,
            color: ColorManager.greyBackground, // red as border color
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: 70.h,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Image.asset(image),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.black38),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}
