part of 'home_cubit.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class HomePageOrdersEmitted extends HomeState {
  final List<Order> allOrders;
  final List<Order> pendingOrders;
  final List<Order> completedOrders;

  HomePageOrdersEmitted(
    this.allOrders,
    this.pendingOrders,
    this.completedOrders,
  );
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
