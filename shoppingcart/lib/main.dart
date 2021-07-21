import 'package:flutter/material.dart';
import 'package:shoppingcart/constants.dart';
import 'package:shoppingcart/providers/cart.dart';
import 'package:shoppingcart/providers/orders.dart';
import 'package:shoppingcart/screens/cart_screen.dart';
import 'package:shoppingcart/screens/orders_screen.dart';
import 'package:shoppingcart/screens/product_detail_screen.dart';
import 'package:shoppingcart/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.redAccent,
          fontFamily: 'Lato',
        ),
        initialRoute: productOverviewScreen,
        routes: {
          productOverviewScreen: (_) => ProductOverviewScreen(),
          productDetailScreen: (_) => ProductDetailScreen(),
          cartScreen: (_) => CartScreen(),
          ordersScreen: (_) => OrdersScreen(),
        },
      ),
    );
  }
}
