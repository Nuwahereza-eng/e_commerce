import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

late String selectedSize;


@override
  void initState() {
    super.initState();
    selectedSize = (widget.product['sizes'] as List)[0] as String;
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
              child: Image.asset('asset/fonts/images/shoe1.png'),
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
                          selectedSize = (widget.product['sizes'] as List)[index] as String;
                        });
                      },
                      child: Chip(label: 
                      Text(
                        (widget.product['sizes'] as List)[index] as String,
                        style: const TextStyle(fontSize: 16),
                      ),
                      backgroundColor: selectedSize == (widget.product['sizes'] as List)[index] as String
                          ? const Color.fromRGBO(254, 206, 1, 1.0)
                          : Colors.grey[300],
                    ),
                  ),);
               } , 
                ),
             ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add to cart action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor:  const Color.fromRGBO(254, 206, 1, 1.0),
                maximumSize: const Size(double.infinity, 50),
                ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}