import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tatware/core/error/failure.dart';
import 'package:tatware/homeScreen/models/expert_model.dart';
import 'package:tatware/homeScreen/repository/home_repo.dart';

import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final ExpertRepository _repository;

  List<ExpertModel>? experts;

  HomeBloc(this._repository) : super(ExpertLoadingState()) {
    on<LoadExpertListEvent>((event, emit) async {
      emit(ExpertLoadingState());

      try {
        Either<Failure, List<ExpertModel>> result =
            await _repository.getAllExperts();
        result.fold((l) => emit(ExpertErrorState(l.message)), (r) {
          emit(ExpertLoadedState(r));
          experts = r;
        });
      } catch (e) {
        emit(ExpertErrorState(e.toString()));
      }
    });

    on<AddToFavoriteEvent>((event, emit) async {
      emit(ExpertLoadingFavoriteState());
      print('before ${experts![event.index].isFavorite}');
      experts![event.index].isFavorite = !experts![event.index].isFavorite;
      print('after ${experts![event.index].isFavorite}');

      emit(ExpertLoadedState(experts!));
    });
  }
}
