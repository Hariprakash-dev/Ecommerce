import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Screens/cart_screen.dart';
import 'package:ecom/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentindex = 0;
  final List<Widget> _screens = [const WelcomeScreen(), const CartScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _screens[_currentindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        
          currentIndex: _currentindex,
          selectedItemColor:   const Color.fromRGBO(16, 16, 16, 1),
          unselectedItemColor: Color.fromRGBO(82, 82, 82, 1),
        
        
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          items: [
          
            BottomNavigationBarItem(icon: _iconIndicator( (Icons.home), 0), label: "",),
            BottomNavigationBarItem(
              label: "",
              icon: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return Badge(
                    backgroundColor: Colors.black,
                    label: Text(cart.cartItemCount.toString()),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  _iconIndicator( (Icons.shopping_bag), 1)
                  ),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _iconIndicator(IconData icon, int index) {
    bool isSelected = _currentindex  == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30),
        if (isSelected)
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }
}


