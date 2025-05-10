import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/cart_provider.dart';

class ProductCartPage extends StatelessWidget {
  const ProductCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Cart'),
        
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          if (cart.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }

          final cartItem = cart[index];
          return ListTile(
            leading: Image.asset(cartItem['imageUrl'] as String, width: 50),
            title: Text(cartItem['name'] as String,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('\$${cartItem['price'] as double}'),
            
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Remove Product'),
                      content: const Text('Are you sure you want to remove this product from your cart?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            cart.remove(cartItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Product removed from cart'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes', style: TextStyle(color: Colors.red)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No', style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}