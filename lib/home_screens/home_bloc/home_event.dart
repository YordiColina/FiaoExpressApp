part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {


  const HomeEvent();

  @override
  List<Object> get props => []; // Equatable permite comparar objetos
}
class GetFieldValuesEvent extends HomeEvent {
 final int index;
 final BuildContext context;
 final List<TextEditingController> controllers;
 const GetFieldValuesEvent(this.controllers, this.context, this.index);

 @override
 List<Object> get props => [controllers,index];
}

class SetValuesEvent extends HomeEvent {
 final BuildContext context;
 final List<TextEditingController> controllers;

 const SetValuesEvent(this.controllers, this.context);

 @override
 List<Object> get props => [controllers];
}

class DeleteClientEvent extends HomeEvent {
 final BuildContext context;
 final List<TextEditingController> controllers;
  DeleteClientEvent(this.controllers, this.context);

 @override
 List<Object> get props => [controllers];
}

class GetProductEvent extends HomeEvent {
 final int index;
 final BuildContext context;
 final List<TextEditingController> controllers;
 const GetProductEvent(this.controllers, this.context, this.index);

 @override
 List<Object> get props => [controllers,index];
}

class GetUserDataEvent extends HomeEvent {
 final String email;
 final BuildContext context;
 final List<TextEditingController> controllers;

 const GetUserDataEvent(this.controllers, this.context, this.email);

 @override
 List<Object> get props => [controllers,email];
}



class NewNotificationRead extends HomeEvent {
 final bool read;
 final BuildContext context;

 NewNotificationRead( this.read,this.context);

 @override
 List<Object> get props => [read,context];
}
