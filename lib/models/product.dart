import 'package:ecomerce_app/models/category.dart';

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final List<String>? sizes;
  final Category category;
  final String productType;

  Product({
    required this.name,
    required this.imageUrls,
    required this.cost,
    this.description,
    this.sizes,
    required this.category,
    required this.productType,
  });
}
