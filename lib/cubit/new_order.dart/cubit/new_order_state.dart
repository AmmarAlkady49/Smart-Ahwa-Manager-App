part of 'new_order_cubit.dart';

@immutable
abstract class NewOrderState {}

class NewOrderInitial extends NewOrderState {}

class AddingNewOrder extends NewOrderState {}

class NewOrderCreated extends NewOrderState {}

class NewOrderError extends NewOrderState {
  final String message;
  
  NewOrderError(this.message);
}