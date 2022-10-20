import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../color_manager.dart';
import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

   PrimaryButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),minimumSize:  MaterialStateProperty.all( Size(width.w, height.h))       ,

            backgroundColor:
            MaterialStateProperty.all(ColorManager.primaryColor),
            textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: setResponsiveFontSize(20)))),
        child:  AutoSizeText(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ));
  }
}
