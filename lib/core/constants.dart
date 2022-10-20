import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tatware/chatScreen/models/chat_item_model.dart';
import 'package:tatware/homeScreen/models/draggableCard.dart';


double setResponsiveFontSize(size) {
  return ScreenUtil().setSp(size);
}

navigateToPage(BuildContext context, page) {
  Navigator.push(
    context,
    PageTransition(
        type: PageTransitionType.rightToLeft,
        child: page,
        curve: Curves.bounceInOut,
        inheritTheme: true,
        ctx: context),
  );
}

List<ChatItem> chatData = [
  ChatItem(text: 'Hi, Whats You Name Firstname?', isBoot: true),
  ChatItem(text: 'Abdalla', isBoot: false),
  ChatItem(text: 'Ok, Abdalla Whats Your Lastname?', isBoot: true),
  ChatItem(text: 'Salah', isBoot: false),
  ChatItem(text: 'Mr Abdalla Salah, What\'s your Title?', isBoot: true),
  ChatItem(text: 'Front-end Developer', isBoot: false),
  ChatItem(
      text: 'What Categories you will need expert in?',
      isBoot: true,
      optionalChild: true)
];

List<DraggableCard> draggableCardsData = [
  DraggableCard(
      image: 'assets/images/card1.png',
      title: 'Information Technology',
      subTitle: '23 Experts'),
  DraggableCard(
      image: 'assets/images/card2.png',
      title: 'Supply Chain',
      subTitle: '12 Experts'),
  DraggableCard(
      image: 'assets/images/card3.png',
      title: 'Security',
      subTitle: '14 Experts'),
  DraggableCard(
      image: 'assets/images/card4.png',
      title: 'Human Resources',
      subTitle: '8 Experts'),
  DraggableCard(
      image: 'assets/images/card5.png',
      title: 'Immigration',
      subTitle: '18 Experts'),
  DraggableCard(
      image: 'assets/images/card6.png',
      title: 'Translation',
      subTitle: '3 Experts'),
];
