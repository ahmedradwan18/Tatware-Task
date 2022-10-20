import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tatware/core/color_manager.dart';

class TypingBox extends StatelessWidget {
  const TypingBox({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final ValueChanged onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.greyBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {

            return ;
          }
          return null;
        },
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(FontAwesomeIcons.globe),
          suffixIcon: Icon(Icons.mic_none),
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
