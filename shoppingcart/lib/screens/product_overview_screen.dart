import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/providers/cart.dart';
import 'package:shoppingcart/screens/cart_screen.dart';
import 'package:shoppingcart/widgets/badge.dart';
import 'package:shoppingcart/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping cart",
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                setState(() {
                  _showOnlyFavorites = true;
                });
              } else {
                setState(() {
                  _showOnlyFavorites = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Favorites"),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text("All Items"),
                value: FilterOptions.All,
              ),
            ],
          ),
          Badge(
            color: Colors.pink,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
            value: cart.itemCount.toString(),
          ),
        ],
      ),
      backgroundColor: Colors.pinkAccent,
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
