import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/color_manager.dart';
import 'package:tatware/core/constants.dart';
import 'package:tatware/homeScreen/presentation/bloc/home_bloc.dart';
import 'package:tatware/homeScreen/presentation/bloc/home_events.dart';

class ExpertCard extends StatelessWidget {
  final String image;
  final String firstName;
  final String lastName;
  final int index;
  final Color? color;

  const ExpertCard({
    required this.image,
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.index,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.greyBackground,image: DecorationImage(image: AssetImage('assets/images/imagePlaceHolder.png',),fit: BoxFit.fitWidth),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Image.network(
              image,
              fit: BoxFit.fitWidth,
            ),
            height: 140.h,
            width: double.infinity,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orangeAccent[100],
              ),
              AutoSizeText(
                '(5.0)',
                style: TextStyle(
                    color: Colors.grey[400], fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    print('tapped');
                    BlocProvider.of<HomeBloc>(context)
                        .add(AddToFavoriteEvent(index));
                  },
                  child: Icon(Icons.favorite, color: color),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              lastName,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: AutoSizeText(
              lastName,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: setResponsiveFontSize(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }
}