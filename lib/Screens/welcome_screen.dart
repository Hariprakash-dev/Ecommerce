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
  final List <String> imagepath = [
    "Assets/Ad/Ad1.jpeg",
    "Assets/Ad/Ad2.jpeg",
    "Assets/Ad/Ad3.jpeg",
    "Assets/Ad/Ad4.jpeg",
    "Assets/Ad/Ad5.jpeg",
    "Assets/Ad/Ad6.jpeg",
  ];
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
                   
                    RichText(text: TextSpan(text: "Welcome back,",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),children: [
                      TextSpan(text: "\nOlivia",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),)
                    ])),
                    
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
                SizedBox(height: 10,),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagepath.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 280.0,
                          width: 280.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagepath[index]),
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
                  children: [Text("Categories",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),), Text("See all",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(241, 241, 241, 1)
                              ),)],
                ),
                
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
                color: Color.fromRGBO(244, 244, 244, 1)
              
              ),
            borderRadius: BorderRadius.circular(20),
          ),
                             
                                 
                                  showCheckmark: false,
                                  color: selectedCategories.contains(category)? WidgetStatePropertyAll(Colors.blue):WidgetStatePropertyAll(Colors.white),
                                                
                                  label: Text(category,style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),),
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
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("New arrivals",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),), Text("See all",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(241, 241, 241, 1)
                              ),)],
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
                              Radius.circular(16),
                            ),
                            border: Border.all(
                              width: 0.9,
                              color: const Color.fromRGBO(244, 244, 244, 1),
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
        
                                Row(children: [Text(product.name,style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(224, 224, 224, 1)
                              ),)]),
                                Text("Glycolic Acid 7% To.",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
                                SizedBox(height: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(244, 244, 244, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    border: Border.all(
                                      color: Color.fromRGBO(244, 244, 244, 1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          top: 4,
                                          bottom: 4,
                                          right: 35,
                                        ),
                                        child: Text("${product.rate} USD",style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
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
                                              padding: const EdgeInsets.all(4.0),
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
