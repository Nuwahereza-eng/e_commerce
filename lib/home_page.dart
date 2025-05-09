
import 'package:e_commerce/product_list.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/product_cart_page.dart';



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
  
  late int currentPage = 0;
List<Widget> pages = [
  ProductList(),
  ProductCartPage(),
];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: const Color.fromRGBO(254, 206, 1, 1.0),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: const Color.fromRGBO(238, 238, 238, 1.0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, ),
            label: '',
          ),
        ],
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}