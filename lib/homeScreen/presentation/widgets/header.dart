import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tatware/core/constants.dart';

class Header extends StatelessWidget {
  final String headerText;

  const Header({
    Key? key,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            headerText,
            style: TextStyle(fontSize: setResponsiveFontSize(16)),
          ),
          const Icon(
            FontAwesomeIcons.ellipsisH,
            color: Colors.grey,
            size: 20,
          )
        ],
      ),
    );
  }
}
