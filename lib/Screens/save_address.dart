import 'package:dotted_line/dotted_line.dart';
import 'package:ecom/Provider/address_provider.dart';
import 'package:ecom/Screens/add_address.dart';
import 'package:ecom/Screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveAddress extends StatelessWidget {
  const SaveAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final addressprovider = Provider.of<AddressProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Address"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAddress()),
              );
            },
            icon: Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: addressprovider.addresses.length,
                itemBuilder: (context, index) {
                  final address = addressprovider.addresses[index];

                  bool isSelected = addressprovider.selectedAddress == address;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addressprovider.addresses[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),

                                Text(
                                  addressprovider.addresses[index].phno
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),

                                Text(
                                  addressprovider.addresses[index].city,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  addressprovider.addresses[index].state,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  addressprovider.addresses[index].buildingno
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  addressprovider.addresses[index].roadno
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  addressprovider.addresses[index].pincode
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    addressprovider.removeAddress(index);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    addressprovider.selectAddress(address);
                                  },
                                  child:
                                      addressprovider.isLoading &&
                                              addressprovider.selectedAddress ==
                                                  address
                                          ? CircularProgressIndicator()
                                          : Checkbox(
                                            value: isSelected,
                                            onChanged: (value) {
                                              addressprovider.selectAddress(
                                                value == true ? address : null,
                                              );
                                            },
                                            checkColor: Colors.white,
                                            activeColor: Colors.black,
                                          ),
                                ),

                                // IconButton(
                                //   onPressed: () {
                                //     addressprovider.selectAddress(address);
                                //   },
                                //   icon: Icon(Icons.select_all),
                                // ),
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
            ],
          );
        },
      ),
    );
  }
}
