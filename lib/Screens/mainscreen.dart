import 'package:ecom/Screens/cart_screen.dart';
import 'package:ecom/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentindex =0;
  final List<Widget> _screens = [
    const WelcomeScreen(),
    const CartScreen()
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: _screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
          
          currentIndex: _currentindex,
      selectedItemColor: Colors.amber,
      unselectedItemColor: const Color.fromRGBO(100, 100, 100, 1),
        
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          items:  const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            
          ]),
    );
  }
}