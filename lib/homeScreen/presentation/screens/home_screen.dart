import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tatware/core/constants.dart';
import 'package:tatware/homeScreen/presentation/bloc/home_bloc.dart';
import 'package:tatware/homeScreen/presentation/bloc/home_events.dart';
import 'package:tatware/homeScreen/presentation/widgets/dragable_card.dart';
import 'package:tatware/homeScreen/presentation/widgets/expert_list.dart';
import 'package:tatware/homeScreen/presentation/widgets/header.dart';
import 'package:tatware/homeScreen/presentation/widgets/home_appbar.dart';
import '../../../core/color_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isFav = false;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LoadExpertListEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        currentIndex: 0,
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.star), label: ''),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.wallet), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ''),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 5.h, left: 16.w, right: 16.w),
                  child: const HomeAppBar(),
                ),
                const Divider(
                  thickness: 1.5,
                ),
                const Header(
                  headerText: 'Recommended Experts',
                ),
                ExpertsList(size: size),
                SizedBox(
                  height: 12.h,
                ),
                const Header(
                  headerText: 'Online Experts',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorManager.greyBackground,
                              radius: 35,
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.green[400],
                              ),
                              top: 4.h,
                              right: 10.w,
                            )
                          ],
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                child: DraggableScrollableSheet(
              initialChildSize: 0.03,
              minChildSize: 0.03,
              maxChildSize: 0.7.h,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 175.w),
                          child: const Divider(
                            thickness: 8,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return DraggableCard(
                                title: draggableCardsData[index].title,
                                image: draggableCardsData[index].image,
                                subTitle: draggableCardsData[index].subTitle,
                              );
                            },
                            itemCount: 6,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
