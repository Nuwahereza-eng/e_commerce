import 'package:flutter/material.dart';
import 'package:e_commerce/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/providers/cart_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254, 206, 1, 1.0)),
          useMaterial3: true,
          fontFamily: 'Lato',
        primaryColor: const Color.fromRGBO(254, 206, 1, 1.0), 
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1.0),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 35, 
            color: Colors.black, 
            fontWeight: FontWeight.bold
      
          )
        ),
        appBarTheme: const AppBarTheme(
        
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        
        ),
        home:  const MyHomePage(),
      ),
    );
  }
}