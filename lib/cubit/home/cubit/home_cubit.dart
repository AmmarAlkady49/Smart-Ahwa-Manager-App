import 'dart:core';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentorship/model/order_repository.dart';

import '../../../model/order.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final InMemoryOrderRepository orderRepository;
  HomeCubit(this.orderRepository) : super(HomeInitial());

  List<Order> allOrders = [];
  List<Order> pendingOrders = [];
  List<Order> completedOrders = [];

  void emitHomePageOrders() {
    try {
      allOrders = orderRepository.getAllOrders();
      pendingOrders = allOrders.where((order) => !order.isCompleted).toList();
      completedOrders = allOrders.where((order) => order.isCompleted).toList();
      emit(HomePageOrdersEmitted(allOrders, pendingOrders, completedOrders));
      log(
        "Emitted HomePageOrdersEmitted with ${allOrders.length} total orders, ${pendingOrders.length} pending orders, and ${completedOrders.length} completed orders.",
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void completeOrder(int orderId) {
    try {
      orderRepository.completedOrder(orderId);
      emitHomePageOrders();
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
