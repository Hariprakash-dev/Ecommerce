import 'package:ecom/Provider/address_provider.dart';
import 'package:ecom/Screens/checkout_screen.dart';
import 'package:ecom/Screens/save_address.dart';
import 'package:ecom/Widgets/button.dart';
import 'package:ecom/Widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatelessWidget {
   AddAddress({super.key});
  final  formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   
    
    TextEditingController name = TextEditingController();
    TextEditingController phno = TextEditingController();
    TextEditingController pincode = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController house = TextEditingController();
    TextEditingController road = TextEditingController();

    void addAddress(BuildContext context) {
      if (formkey.currentState!.validate()) {
        final addressprovider = Provider.of<AddressProvider>(
          context,
          listen: false,
        );
        Address newAddress = Address(
          name: name.text,
          phno: phno.text,
          pincode: pincode.text,
          state: state.text,
          city: city.text,
          buildingno: house.text,
          roadno: road.text,
        );
        addressprovider.addAddress(newAddress);
        name.clear();
        pincode.clear();
        phno.clear();
        state.clear();
        city.clear();
        house.clear();
        road.clear();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Add Address"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                textFormField(name, "Full Name"),
                SizedBox(height: 10),
                textFormField(phno, "Phone Number"),
                SizedBox(height: 10),
                textFormField(pincode, "Pincode"),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: textFormField(state, "State")),
                    SizedBox(width: 15),
                    Expanded(child: textFormField(city, "City")),
                  ],
                ),
                SizedBox(height: 10),
                textFormField(house, "House NO., Building Name"),
                SizedBox(height: 10),
                textFormField(road, "Road name, Area"),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    addAddress(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SaveAddress()),
                      );
                  },
                  child: buttons(context, "Add Address"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
