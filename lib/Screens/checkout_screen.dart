import 'package:ecom/Provider/address_provider.dart';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Screens/pdf_screen.dart';
import 'package:ecom/Screens/save_address.dart';
import 'package:ecom/Widgets/create_pdf.dart';
import 'package:ecom/Widgets/pdf_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prices = Provider.of<CartProvider>(context);
    final addressprovider = Provider.of<AddressProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfScreen()),
              );
            },
            icon: Icon(Icons.picture_as_pdf, color: Colors.white),
          ),
          IconButton(
            onPressed: () async {
              final pdffile = await PdfGenerator.generate(context);
              SaveAndOpenDocument.openPdf(pdffile);
            },
            icon: Icon(Icons.print, color: Colors.white),
          ),
        ],

        centerTitle: true,
        backgroundColor: Color.fromRGBO(9, 86, 176, 1),
        title: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SaveAddress()),
                      );
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(12),

                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Colors.black),
                  ),

                  child: FutureBuilder(
                    future: Future.delayed(
                      Duration(milliseconds: 100),
                    ), 
                    builder: (context, snapshot) {
                      final addressProvider = Provider.of<AddressProvider>(
                        context,
                      );

                      if (addressProvider.selectedAddress == null) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressprovider.selectedAddress?.name ?? "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            addressprovider.selectedAddress?.phno ?? "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            addressprovider.selectedAddress?.buildingno ??
                                "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            addressprovider.selectedAddress?.roadno ?? "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            addressprovider.selectedAddress?.city ?? "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            addressprovider.selectedAddress?.state ?? "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            addressprovider.selectedAddress?.pincode ?? "null",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              payment(
                context,
                "Credit/Debit/ATM Card",
                Icons.wallet,
                "Card Number",
                buttons(context, "Confirm"),
                textform(),
              ),
              SizedBox(height: 10),
              payment(
                context,
                "UPI",
                Icons.phone_iphone,
                "UPI ID",
                buttons(context, "Confirm"),
                textform(),
              ),
              SizedBox(height: 10),
              payment(
                context,
                "Net Banking",
                Icons.language,
                "Card Number",
                buttons(context, "Confirm"),
                textform(),
              ),
              SizedBox(height: 10),
              payment(
                context,
                "Cash On Delivery",
                Icons.money,
                "Payment",
                buttons(context, "Confirm"),
                textform(),
              ),
              SizedBox(height: 10),
              payment(
                context,
                "Wallet",
                Icons.account_balance_wallet,
                "Card Number",
                buttons(context, "Confirm"),
                textform(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Price Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total(${prices.cartItemCount} Items)",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${prices.totalproductprice}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Coupon",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "AED(0.0%)",
                          style: TextStyle(
                            color: Color.fromRGBO(77, 171, 37, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    "0",
                    style: TextStyle(
                      color: Color.fromRGBO(77, 171, 37, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Charges",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "35.0",
                    style: TextStyle(
                      color: Color.fromRGBO(77, 171, 37, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Secured Packaging Fee",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "10.0",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: Color.fromRGBO(89, 154, 219, 1)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${prices.totalPrice}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: Color.fromRGBO(89, 154, 219, 1)),
              SizedBox(height: 10),
              buttons(context, "Confirm Order"),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionTile payment(
    BuildContext context,
    String title,
    IconData icons,
    String text,
    Container buttonss,
    TextFormField form,
  ) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Icon(icons, color: Colors.black),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.white,
            ),

            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text(text)],
                ),
                form,
                SizedBox(height: 10),
                buttonss,
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextFormField textform() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.wallet),
        hintText: "XXXXXX",
        fillColor: Colors.white,

        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Container buttons(BuildContext context, String text) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.black),
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Text text(String text) => Text(
    text,
    style: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}
