// widgets/product_row.dart
import 'package:ecomerce_app/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductRow extends StatelessWidget {
  final String productType;
  final List<Product> products;

  const ProductRow({
    required this.productType,
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      print("Products for $productType are empty.");
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            productType,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 205,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (_, index) => ProductTile(product: products[index]),
            separatorBuilder: (_, index) => const SizedBox(width: 24),
          ),
        ),
      ],
    );
  }
}
