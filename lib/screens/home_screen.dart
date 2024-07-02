// screens/home_screen.dart
import 'package:ecomerce_app/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecomerce_app/theme/theme_bloc.dart';
import 'package:ecomerce_app/widgets/cart_appbar_action.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/product/product_bloc.dart';
import '../models/category.dart';
import '../models/categories.dart'; // Import the categories here
import '../widgets/product_tile.dart';
import '../widgets/category_tile.dart';
import '../widgets/search_bar.dart' as custom; // Alias the custom search bar

const String manLookRightImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/man-look-right.jpg';
const String dogImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/pet.jpg';
const String womanLookLeftImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/woman-look-left.jpg';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String searchString;
  final ProductRepository productRepository =
      ProductRepository(); // Initialize ProductRepository

  @override
  void initState() {
    searchString = '';
    super.initState();
    context.read<ProductBloc>().add(LoadProductsEvent());
  }

  void setSearchString(String value) {
    setState(() {
      searchString = value;
    });
    context.read<ProductBloc>().add(SearchProductsEvent(value));
  }

  @override
  Widget build(BuildContext context) {
    var listViewPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24);

    return Scaffold(
      appBar: AppBar(
        title: custom.SearchBar(
          onChanged: setSearchString,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.toggle);
            },
          ),
          const CartAppBarAction(),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            List<Widget> searchResultTiles = [];
            if (searchString.isNotEmpty) {
              searchResultTiles = state.products
                  .map(
                    (p) => ProductTile(product: p),
                  )
                  .toList();
            }
            return searchString.isNotEmpty
                ? GridView.count(
                    padding: listViewPadding,
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: .78,
                    children: searchResultTiles,
                  )
                : ListView(
                    padding: listViewPadding,
                    children: [
                      Text(
                        'Shop by Category',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      CategoryTile(
                        imageUrl: manLookRightImageUrl,
                        category: mensCategory,
                        products: productRepository
                            .products, // Pass the products here
                        imageAlignment: Alignment.topCenter,
                      ),
                      const SizedBox(height: 16),
                      CategoryTile(
                        imageUrl: womanLookLeftImageUrl,
                        category: womensCategory,
                        products: productRepository
                            .products, // Pass the products here
                        imageAlignment: Alignment.topCenter,
                      ),
                      const SizedBox(height: 16),
                      CategoryTile(
                        imageUrl: dogImageUrl,
                        category: petsCategory,
                        products: productRepository
                            .products, // Pass the products here
                      ),
                    ],
                  );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
