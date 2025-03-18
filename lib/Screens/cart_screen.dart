import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Shopping Cart",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset("Assets/pro2.jpeg", height: 100, width: 100),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("URBAN BOTANICS\nAloe Vera Moisturi.."),
                            Icon(Icons.remove),
                          ],
                        ),
                        Row(
                          children: [
                            Text("S4.50"),
                                                        SizedBox(width: 15,),

                            SizedBox(
                              width: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.remove),
                                      Text("1"),
                                      Icon(Icons.add),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          
              Divider(color: Color.fromRGBO(165, 167, 169, 1), thickness: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset("Assets/pro3.jpeg", height: 100, width: 100),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("URBAN BOTANICS\nAloe Vera Moisturi.."),
                            Icon(Icons.remove),
                          ],
                        ),
                        Row(
                          children: [
                            Text("S4.50"),
                            SizedBox(width: 15,),
                            SizedBox(
                              width: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.remove),
                                      Text("1"),
                                      Icon(Icons.add),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Divider(color: Color.fromRGBO(165, 167, 169, 1), thickness: 1),
               TextFormField(
                
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(185, 185, 185, 1),
                                
                                prefix: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text("Add Coupon code",style: TextStyle(color: Colors.black),)
                                ],
                              ),
          
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sub Total(2 Items)"),
                                    Text("Order and get 34 items",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen,
                                  ),)
                                  ],
                                ),
                                  Column(
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("S 14.3"),
                                    Text("Free shipping",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen,
                                  ),)
                                  ],
                                )
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Charges"),
                                  Text("35.0")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Secured Packaging Fee"),
                                  Text("10.0")
                              ],
                            ),
                            Divider(color: Color.fromRGBO(165, 167, 169, 1), thickness: 1),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Secured Packaging Fee"),
                                  Text("S 59.3")
                              ],
                            ),
                             Divider(color: Color.fromRGBO(165, 167, 169, 1), thickness: 1),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Grand Total"),
                                  Text("S 59.3")
                              ],
                            ),
                             Divider(color: Color.fromRGBO(165, 167, 169, 1), thickness: 1),

                              SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "Proceed to Checkout",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          
              
            ],
          ),
        ),
      ),
    );
  }
}
