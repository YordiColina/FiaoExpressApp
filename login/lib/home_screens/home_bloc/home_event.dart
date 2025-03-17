part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
 final List<TextEditingController> controllers;
 final BuildContext context;
  const HomeEvent(this.controllers,this.context);

  @override
  List<Object> get props => [controllers]; // Equatable permite comparar objetos
}
class GetFieldValuesEvent extends HomeEvent {
 final int index;
 const GetFieldValuesEvent(super.controllers, super.context, this.index);

 @override
 List<Object> get props => [controllers,index];
}

class SetValuesEvent extends HomeEvent {

 const SetValuesEvent(super.controllers, super.context);

 @override
 List<Object> get props => [controllers];
}

class DeleteClientEvent extends HomeEvent {
  DeleteClientEvent(super.controllers, super.context);

 @override
 List<Object> get props => [controllers];
}

class GetProductEvent extends HomeEvent {
 final int index;
 const GetProductEvent(super.controllers, super.context, this.index);

 @override
 List<Object> get props => [controllers,index];
}

class GetUserDataEvent extends HomeEvent {
 final String email;

 const GetUserDataEvent(super.controllers, super.context, this.email);

 @override
 List<Object> get props => [controllers,email];
}