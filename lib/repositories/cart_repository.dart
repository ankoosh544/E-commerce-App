import 'package:ecomerce_app/models/order_item.dart';

class CartRepository {
  final List<OrderItem> _itemsInCart = [];

  List<OrderItem> get itemsInCart => _itemsInCart;

  double get totalCost {
    double total = 0;
    for (var item in _itemsInCart) {
      total += item.product.cost;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    _itemsInCart.add(orderItem);
  }

  void remove(OrderItem orderItem) {
    _itemsInCart.remove(orderItem);
  }
}
