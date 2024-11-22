part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
 final List<TextEditingController> controllers;
  const HomeEvent(this.controllers);

  @override
  List<Object> get props => [controllers]; // Equatable permite comparar objetos
}
class GetFieldValuesEvent extends HomeEvent {
 const GetFieldValuesEvent(super.controllers);

 @override
 List<Object> get props => [controllers];
}

class SetValuesEvent extends HomeEvent {
 const SetValuesEvent(super.controllers);

 @override
 List<Object> get props => [controllers];
}