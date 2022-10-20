import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../../../core/color_manager.dart';
import '../../../core/constants.dart';

class MyMessage extends StatelessWidget {
  final int index;
  const MyMessage({
    Key? key,required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 12.h, horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(

            width: 300.w,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h,right: 10.w),
                child: Text(
                  chatData[index].text!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Image.asset('assets/images/seenlogo.png'),
        ],
      ),
    );
  }
}
