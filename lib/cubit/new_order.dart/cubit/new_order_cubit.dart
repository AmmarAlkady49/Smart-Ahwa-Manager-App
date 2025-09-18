import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/drink.dart';
import '../../../model/order.dart';
import '../../../model/order_repository.dart';

part 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  final InMemoryOrderRepository orderRepository;
  NewOrderCubit(this.orderRepository) : super(NewOrderInitial());

  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController specialInstructionsController =
      TextEditingController();
  Drink selectedDrinkType = Tea();

  void createOrder() {
    emit(AddingNewOrder());
    try {
      final newOrder = Order.create(
        orderRepository.getAllOrders().length + 1,
        customerNameController.text,
        selectedDrinkType,
        selectedDrinkType.prepareHint(specialInstructionsController.text),
      );
      orderRepository.addOrder(newOrder);
      emit(NewOrderCreated());
      log(
        'Order created successfully ${orderRepository.getAllOrders().length}',
      );
    } catch (e) {
      log(e.toString());
      emit(NewOrderError(e.toString()));
    }
  }
}
