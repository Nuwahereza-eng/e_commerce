import 'package:flutter/material.dart';
import 'package:e_commerce/global_variables.dart';

class ProductCartPage extends StatelessWidget {
  const ProductCartPage({super.key});
  @override
  Widget build(BuildContext context) {
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
            title: Text(cartItem['name'] as String),
            subtitle: Text('\$${cartItem['price'] as double}'),
            
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                cart.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Product removed from cart'),
                    duration: const Duration(seconds: 2),
                  ),
                );
                (context as Element).reassemble();
              },
            ),
          );
        },
      ),
    );
  }
}