import 'order.dart';

abstract class OrderRepository {
  void addOrder(Order order);
  void completedOrder(int orderId);
  List<Order> getAllOrders();
}


class InMemoryOrderRepository implements OrderRepository {
  final List<Order> _orders = [];

  @override
  void addOrder(Order order) {
    _orders.add(order);
  }

  @override
  void completedOrder(int orderId) {
    final order = _orders.firstWhere((o) => o.id == orderId, orElse: () => throw Exception('Order not found'));
    order.markCompleted();
  }

  @override
  List<Order> getAllOrders() {
    return List.unmodifiable(_orders);
  }
}