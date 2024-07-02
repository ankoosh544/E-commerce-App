// bloc/cart/cart_state.dart
part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<OrderItem> itemsInCart;
  final double totalCost;

  const CartUpdated(this.itemsInCart, this.totalCost);

  @override
  List<Object> get props => [itemsInCart, totalCost];
}
