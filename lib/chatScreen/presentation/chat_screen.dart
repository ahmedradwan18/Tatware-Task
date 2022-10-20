import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/color_manager.dart';
import '../../core/constants.dart';
import '../models/chat_item_model.dart';
import 'widgets/boot_message.dart';
import 'widgets/my_message.dart';
import 'widgets/typing_box.dart';
import '../../homeScreen/presentation/screens/home_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String myText = '';
  TextEditingController controller = TextEditingController();
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: listScrollController,
                itemBuilder: (BuildContext context, int index) {
                  return chatData[index].isBoot == true
                      ? BootMessage(messageIndex: index)
                      : MyMessage(
                          index: index,
                        );
                },
                itemCount: chatData.length,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    navigateToPage(context, const HomeScreen());
                  },
                  child: const Divider(
                    thickness: 1.5,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, bottom: 10.h, left: 16.w, right: 16.w),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 90.w,
                          height: 60.h,
                          child: TypingBox(
                            controller: controller,
                            onChanged: (value) {
                              myText = value;
                            },
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        if (myText != '') {
                          setState(() {
                            chatData.add(ChatItem(text: myText, isBoot: false));
                          });
                          if (listScrollController.hasClients) {
                             double position =
                                listScrollController.position.maxScrollExtent;
                            listScrollController.animateTo(
                              position,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                            );
                          }
                          print(myText);
                          controller.text = '';
                        }
                      },
                      icon: const Icon(FontAwesomeIcons.paperPlane),
                      color: ColorManager.primaryColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
