// screens/category_screen.dart
import 'package:flutter/material.dart';
import 'package:ecomerce_app/widgets/cart_appbar_action.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../widgets/product_row.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    required this.category,
    required this.products,
    Key? key,
  }) : super(key: key);

  final Category category;
  final List<Product> products;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Category get category => widget.category;

  @override
  Widget build(BuildContext context) {
    print("Products passed to CategoryScreen: ${widget.products}");

    List<ProductRow> productRows = category.selections.map((s) {
      List<Product> filteredProducts =
          widget.products.where((p) => p.productType == s).toList();
      return ProductRow(productType: s, products: filteredProducts);
    }).toList();

    print(productRows.length);
    print("========================ProductRows Length");
    print("========================ProductRow ${productRows}");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 18),
        itemCount: productRows.length,
        itemBuilder: (_, index) => productRows[index],
        separatorBuilder: (_, index) => const SizedBox(height: 18),
      ),
    );
  }
}
