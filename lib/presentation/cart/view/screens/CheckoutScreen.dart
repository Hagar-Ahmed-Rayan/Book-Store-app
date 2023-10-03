import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/cart/models/cartmodel/CartModel.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final Map<String, dynamic> checkoutData;
  CartModel  cartmodel;

 CheckoutScreen({required this.checkoutData,required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    final data = checkoutData['data'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,

        title: Text('Checkout'),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Name:${cartmodel.data!.user!.userName!}'),
            Text('Email:'),
            Text('Address:'),
            Text('Phone'),
            SizedBox(height: 16),
            Text(
              'Order Summary:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Total:${cartmodel.data!.total!}'),
            SizedBox(height: 16),
            Text(
              'Cart Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data['cart_items'].length,
              itemBuilder: (context, index) {
                final item = data['cart_items'][index];
                return ListTile(
                  title: Text(item['item_product_name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${item['item_product_price']}'),
                      Text('Quantity: ${item['item_quantity']}'),
                      Text('Total: \$${item['item_total']}'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


