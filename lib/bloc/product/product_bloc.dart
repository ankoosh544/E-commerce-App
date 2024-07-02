// bloc/product/product_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/product.dart';
import '../../repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository = ProductRepository();

  ProductBloc() : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) {
      emit(ProductsLoaded(_productRepository.products));
    });

    on<SearchProductsEvent>((event, emit) {
      final results = _productRepository.products
          .where((product) =>
              product.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ProductsLoaded(results));
    });
  }
}
