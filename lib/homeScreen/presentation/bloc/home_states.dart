import 'package:equatable/equatable.dart';
import 'package:tatware/homeScreen/models/expert_model.dart';



abstract class HomeStates extends Equatable{


}

class ExpertLoadingState extends HomeStates{
  @override
  List<Object?> get props =>[];

}



class ExpertLoadedState extends HomeStates{
  final List<ExpertModel> experts;
  ExpertLoadedState(this.experts);
  @override
  List<Object?> get props =>[experts];

}

class ExpertErrorState extends HomeStates{
  final String message;
  ExpertErrorState(this.message);
  @override
  List<Object?> get props =>[message];

}


class ExpertLoadingFavoriteState extends HomeStates{
  @override
  List<Object?> get props =>[];

}