import 'package:flutter/material.dart';

class ProductCartPage extends StatelessWidget {
  const ProductCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Cart'),
        backgroundColor: const Color.fromRGBO(254, 206, 1, 1.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Product Cart Page',
              style: TextStyle(fontSize: 24),
            ),
            
          ],
        ),
      ),
    );
  }
}