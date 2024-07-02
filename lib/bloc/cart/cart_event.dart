// bloc/cart/cart_event.dart
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final OrderItem orderItem;

  const AddToCartEvent(this.orderItem);

  @override
  List<Object> get props => [orderItem];
}

class RemoveFromCartEvent extends CartEvent {
  final OrderItem orderItem;

  const RemoveFromCartEvent(this.orderItem);

  @override
  List<Object> get props => [orderItem];
}
