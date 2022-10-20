import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
}

class LoadExpertListEvent extends HomeEvents {
  @override
  List<Object?> get props => [];
}

class AddToFavoriteEvent extends HomeEvents {
  final int index;

 const AddToFavoriteEvent(this.index);

  @override
  List<Object?> get props => [index];
}
