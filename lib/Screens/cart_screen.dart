import 'package:dotted_line/dotted_line.dart';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Screens/checkout_screen.dart';
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body:
      cartProvider.cartItems.isEmpty
      ? Center(child: Text("Your cart is empty!"))
      :
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cartProvider.cartItems.length,
               
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = cartProvider.cartItems.keys.elementAt(index);
                  final quantity = cartProvider.cartItems[product]!;
        
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product.imagepath),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:180,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product.name,style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),),
                                  GestureDetector(
                                    onTap: () {
                                      cartProvider.removeFromCart(product);
                                    },
                                    child: Icon(Icons.close,color: Color.fromRGBO(222, 222, 222, 1),),
                                  ),
                                ],
                              ),
                            ),
                            Text(product.category,style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),),
                            Row(
                              children: [
                                Text("${product.rate}",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
                                SizedBox(width: 10),
                                Container(
                                  height: 40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    border: Border.all(
                                      color: Color.fromRGBO(128, 128, 128, 1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          cartProvider.removeFromCart(
                                            product,
                                          );
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                      
                                  
                                      Text("$quantity"),
                               
                                      GestureDetector(
                                        onTap: () {
                                          cartProvider.addToCart(product);
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
        
                 
                },
                separatorBuilder: (BuildContext context, int index) {
                  return DottedLine();
                },
              ),
            ),
        
           
            Divider(color: Color.fromRGBO(224, 224, 224, 1), thickness: 1),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(224, 224, 224, 1),
                hintText: "Add Coupon code",
                hintStyle: TextStyle(color: Color.fromRGBO(186, 186, 186, 1)),
        
                prefixIcon: Icon(Icons.sell),
        
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color.fromRGBO(191, 191, 191, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color.fromRGBO(191, 191, 191, 1)),
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
                    Text("Sub Total(${cartProvider.cartItems.length} Items)",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
                    Text(
                      "Order and get 34 items",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${cartProvider.totalproductprice}",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
                    Text(
                      "Free shipping",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Delivery Charges",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),), Text("35.0",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),)],
            ),
        
                      SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Secured Packaging Fee",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),), Text("10",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),)],
            ),
             Divider(color: Color.fromRGBO(224, 224, 224, 1), thickness: 1),
                       SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Grand Total",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
                Text(cartProvider.totalPrice.toString(),style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),),
              ],
            ),
                        SizedBox(height: 5,),

             Divider(color: Color.fromRGBO(224, 224, 224, 1), thickness: 1),
        
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                      
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
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
            ),
          ],
        ),
      ),
    );
  }
}
