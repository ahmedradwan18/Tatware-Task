import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/chatScreen/presentation/chat_screen.dart';

import '../../../core/color_manager.dart';
import '../../../core/constants.dart';

class BootMessage extends StatefulWidget {
  final int messageIndex;
  final bool? optionalChild;

  const BootMessage({
    required this.messageIndex,
    this.optionalChild,
    Key? key,
  }) : super(key: key);

  @override
  State<BootMessage> createState() => _BootMessageState();
}

class _BootMessageState extends State<BootMessage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;

    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset('assets/images/robotlogo.png'),
            backgroundColor: ColorManager.greyBackground,
            radius: 22,
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 300.w,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 40.w, top: 10.h, bottom: 10.h, left: 10.w),
                      child: Text(
                        chatData[widget.messageIndex].text!,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.greyBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                chatData[widget.messageIndex].optionalChild == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: checkBoxValues.keys.map((String key) {
                              return Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Theme(
                                  data: theme.copyWith(
                                      checkboxTheme: newCheckBoxTheme),
                                  child: CheckboxListTile(
                                    title: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        key,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      right: 20.w,
                                    ),
                                    checkColor: Colors.white,
                                    activeColor: ColorManager.primaryColor,
                                    value: checkBoxValues[key],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkBoxValues[key] = value!;

                                      });
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const AutoSizeText(
                            'Say Done, Or Press Send to Copy',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

Map<String, bool> checkBoxValues = {
  'Security': false,
  'Supply Chain': false,
  'Information Technology': false,
  'Human resource': false,
  'Business research': false,
};
