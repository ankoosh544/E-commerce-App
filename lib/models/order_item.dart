import 'package:ecomerce_app/models/product.dart';

class OrderItem {
  final Product product;
  final String? selectedSize;
  final String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}
