
import 'package:flutter/material.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/product_card.dart';
import 'package:e_commerce/product_details_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage ({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> filters = const[
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Reebok',
    'Converse',
  ];
  late String selectedFilter;
  late int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(238, 238, 238, 1.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final label = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = label;
                        });
                      
                      },
                      child: Chip(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        backgroundColor: selectedFilter == label ? Theme.of(context).primaryColor : const Color.fromRGBO(245, 245, 245, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 245, 245, 1.0),
                          width: 1,
                        ),
                        label: Text(label),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length, 
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailsPage(product: product);
                          },
                        ),
                      );

                    },
                    child: ProductCard(
                    imageUrl: product['imageUrl'] as String,
                    name: product['name'] as String,
                    price: product['price'] as double,
                    background: index.isEven ? Color.fromRGBO(216, 240, 253, 1) : Color.fromRGBO(245, 245, 245, 1),),
                  );
                
                },
              ),
            ),  
            BottomNavigationBar(
              currentIndex: currentPage,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: '',
                ),
                
              ],
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: (index) {

                setState(() {
                  currentPage = index;
                });
              },
            ),
          ],
        ),
      
      ),
    );
  }
}