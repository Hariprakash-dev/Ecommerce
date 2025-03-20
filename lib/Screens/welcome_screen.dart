import 'package:ecom/Models/product.dart';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> categories = ["Fragrance", "Skincare", "Makeup", "Hair"];
  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    final filterProducts = productList.where((product) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(product.category);
    }).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome back,\nOlivia"),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(245, 245, 245, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120.0,
                          width: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/vegetables.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Categories"), Text("See all")],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        categories
                            .map(
                              (category) => Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: FilterChip(
                                    
                          
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                color: selectedCategories.contains(category) ? Colors.grey : Colors.grey, 
              
              ),
            borderRadius: BorderRadius.circular(20),
          ),
                             
                                 
                                  showCheckmark: false,
                                  color: selectedCategories.contains(category)? WidgetStatePropertyAll(Colors.blue):WidgetStatePropertyAll(Colors.white),
                                                
                                  label: Text(category),
                                  selected: selectedCategories.contains(category),
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        selectedCategories.add(category);
                                      } else {
                                        selectedCategories.remove(category);
                                      }
                                    });
                                  },
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("New arrivals"), Text("See all")],
                ),
        
                SizedBox(
                  height: 290,
                  child: ListView.builder(
                    itemCount: filterProducts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      final product = filterProducts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                            border: Border.all(
                              width: 0.5,
                              color: const Color.fromRGBO(185, 185, 185, 1),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Image.asset(
                                        product.imagepath,
                                        height: 140,
                                        width: 140,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
        
                                Row(children: [Text(product.name)]),
                                Text("Glycolic Acid 7% To."),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    border: Border.all(
                                      color: Color.fromRGBO(185, 185, 185, 1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          top: 8,
                                          bottom: 8,
                                          right: 15,
                                        ),
                                        child: Text("S14.50 USD"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                                 Provider.of<CartProvider>(context, listen: false)
                    .addToCart(product);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
