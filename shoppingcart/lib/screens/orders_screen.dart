import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/providers/orders.dart' show Orders;
import 'package:shoppingcart/widgets/app_drawer.dart';
import 'package:shoppingcart/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Orders :"),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          order: orderData.orders[i],
        ),
      ),
    );
  }
}
