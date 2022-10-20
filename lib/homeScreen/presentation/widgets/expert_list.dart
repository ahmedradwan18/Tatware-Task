import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import '../../../core/color_manager.dart';
import '../../../core/constants.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';
import 'expert_card.dart';

class ExpertsList extends StatelessWidget {
  const ExpertsList({
    required this.size,
    Key? key,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 250.h,
        child: BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
          print('state is $state');

          if (state is ExpertLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ExpertErrorState) {
            return const Center(
              child: Text('Error while fetching data'),
            );
          }
          if (state is ExpertLoadedState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 250.h,
                  width: size.width / 2.1,
                  child: ExpertCard(
                    image: state.experts[index].avatar,
                    lastName: state.experts[index].lastName,
                    firstName: state.experts[index].firstName,
                    index: index,
                    color: state.experts[index].isFavorite == true
                        ? Colors.red
                        : Colors.grey[400],
                  ),
                );
              },
              itemCount: state.experts.length,
            );
          }

          return Container();
        }),
      ),
    );
  }
}


