import 'drink.dart';

class Order {
  final int _id;
  final String _customerName;
  final Drink _drinkType;
  final String _specialInstructions;
  bool _isCompleted;

  Order._(
    this._id,
    this._customerName,
    this._drinkType,
    this._specialInstructions,
    this._isCompleted,
  );

  int get id => _id;
  String get customerName => _customerName;
  Drink get drinkType => _drinkType;
  String get specialInstructions => _specialInstructions;
  bool get isCompleted => _isCompleted;

  static Order create(
    int id,
    String customerName,
    Drink drinkType, [
    String specialInstructions = '',
  ]) {
    return Order._(id, customerName, drinkType, specialInstructions, false);
  }

  void markCompleted() => _isCompleted = true;
}
