import 'package:ecom/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body:
          cartProvider.cartItems.isEmpty
              ? Center(child: Text("Your cart is empty!"))
              : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: cartProvider.cartItems.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = cartProvider.cartItems.keys.elementAt(
                            index,
                          );
                          final quantity = cartProvider.cartItems[product]!;

                          return ListTile(
                            leading: Image.asset(product.imagepath),
                            minLeadingWidth: 2,

                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(product.name),

                                    GestureDetector(
                                      onTap: () {
                                        cartProvider.removeFromCart(product);
                                      },
                                      child: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                Text(product.category),
                                Row(
                                  children: [
                                    Text("₹${product.rate * quantity}"),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                        border: Border.all(
                                          color: Color.fromRGBO(
                                            185,
                                            185,
                                            185,
                                            1,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartProvider.removeFromCart(
                                                  product,
                                                );
                                              },
                                              child: Icon(Icons.remove),
                                            ),
                                            SizedBox(width: 25),

                                            Text("$quantity"),
                                            SizedBox(width: 25),
                                            GestureDetector(
                                              onTap: () {
                                                cartProvider.addToCart(product);
                                              },
                                              child: Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 1,
                            color: Colors.grey, // Custom style
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 30),
                    Divider(
                      color: Color.fromRGBO(165, 167, 169, 1),
                      thickness: 1,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(185, 185, 185, 1),
                        hintText: "Add Coupon code",
                        hintStyle: TextStyle(color: Colors.black),

                        prefixIcon: Icon(Icons.add),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(185, 185, 185, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(185, 185, 185, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sub Total(${cartProvider.cartItems.length} Items)",
                            ),
                            Text(
                              "Order and get 34 items",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("45"),
                            Text(
                              "Free shipping",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Delivery Charges"), Text("35.0")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Secured Packaging Fee"), Text("10.0")],
                    ),
                    Divider(
                      color: Color.fromRGBO(165, 167, 169, 1),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Secured Packaging Fee"), Text("S 59.3")],
                    ),
                    Divider(
                      color: Color.fromRGBO(165, 167, 169, 1),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Grand Total"), Text("S 59.3")],
                    ),
                    Divider(
                      color: Color.fromRGBO(165, 167, 169, 1),
                      thickness: 1,
                    ),

                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
    );
  }
}
