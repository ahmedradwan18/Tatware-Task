import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class LocalizationBottom extends StatelessWidget {
  const LocalizationBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.globe),
        SizedBox(
          width: 10.w,
        ),
        AutoSizeText(
          'English',
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: setResponsiveFontSize(16)),
        )
      ],
    );
  }
}
