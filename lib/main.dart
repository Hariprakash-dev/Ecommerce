import 'package:ecom/Provider/address_provider.dart';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Screens/login_screen.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider()),ChangeNotifierProvider(create: (context)=>AddressProvider())],
      child: MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen());
  }
}
