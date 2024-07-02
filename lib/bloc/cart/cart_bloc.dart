// bloc/cart/cart_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/order_item.dart';
import '../../repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository = CartRepository();

  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) {
      _cartRepository.add(event.orderItem);
      emit(CartUpdated(_cartRepository.itemsInCart, _cartRepository.totalCost));
    });

    on<RemoveFromCartEvent>((event, emit) {
      _cartRepository.remove(event.orderItem);
      emit(CartUpdated(_cartRepository.itemsInCart, _cartRepository.totalCost));
    });
  }
}
