// screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../models/order_item.dart';
import '../widgets/call_to_action_button.dart';
import '../widgets/product_image.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartUpdated) {
              return Column(
                children: [
                  const Text('Cart'),
                  Text(
                    '${state.itemsInCart.length} items',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }
            return const Text('Cart');
          },
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated) {
            List<Widget> orderItemRows = state.itemsInCart
                .map(
                  (item) => Row(
                    children: [
                      SizedBox(
                        width: 125,
                        child: ProductImage(
                          product: item.product,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '\$${item.product.cost}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => context
                            .read<CartBloc>()
                            .add(RemoveFromCartEvent(item)),
                        color: Colors.red,
                      )
                    ],
                  ),
                )
                .toList();

            return Column(
              children: [
                if (orderItemRows.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      itemCount: orderItemRows.length,
                      itemBuilder: (_, index) => orderItemRows[index],
                      separatorBuilder: (_, index) => const SizedBox(
                        height: 16,
                      ),
                    ),
                  )
                else
                  const Expanded(
                    child: Center(
                      child: Text('Your cart is empty'),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '\$${state.totalCost.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      CallToActionButton(
                        onPressed: () {},
                        labelText: 'Check Out',
                        minSize: const Size(220, 45),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
