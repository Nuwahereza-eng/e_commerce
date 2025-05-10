import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

late int selectedSize=0;


@override
  void initState() {
    super.initState();
    selectedSize = (widget.product['sizes'] as List)[0] as int;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details',
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('${widget.product['imageUrl'] }',
                fit: BoxFit.cover,
                width: double.infinity,
                
              ),
            ),
            const SizedBox(height: 16),
             Text(
              widget.product['name'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            
            const SizedBox(height: 8),
            Text(
              '\$${widget.product['price'] as double}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
             SizedBox(
              height: 50,
               child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (widget.product['sizes'] as List).length,
                itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = (widget.product['sizes'] as List)[index] as int;
                        });
                      },
                      child: Chip(label: 
                      Text(
                        '${(widget.product['sizes'] as List)[index] as int}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      backgroundColor: selectedSize == (widget.product['sizes'] as List)[index] as int
                          ? const Color.fromRGBO(254, 206, 1, 1.0)
                          : Colors.grey[300],
                    ),
                  ),
                );
              },
                ),
             ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (selectedSize != 0) {
                  Provider.of<CartProvider>(context, listen: false).addItem(
                    {
                      'imageUrl': widget.product['imageUrl'],
                      'name': widget.product['name'],
                      'price': widget.product['price'],
                      'size': selectedSize,
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a size'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product added to cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
                // Add to cart action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor:  const Color.fromRGBO(254, 206, 1, 1.0),
                fixedSize: const Size(350, 50),
                ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}