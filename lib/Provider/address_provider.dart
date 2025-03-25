import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Address {
  final String name;
  final dynamic phno;
  final dynamic pincode;
  final String state;
  final String city;
  final dynamic buildingno;
  final dynamic roadno;
  Address({
    required this.name,
    required this.phno,
    required this.pincode,
    required this.state,
    required this.city,
    required this.buildingno,
    required this.roadno,
  });
  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "phno": phno,
      "pincode": pincode,
      "state": state,
      "city": city,
      "buildingno": buildingno,
      "roadno": roadno,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json["name"],
      phno: json["phno"],
      pincode: json["pincode"],
      state: json["state"],
      city: json["city"],
      buildingno: json["buildingno"],
      roadno: json["roadno"],
    );
  }
  @override
  String toString() {
    return "$name, $phno,$pincode,$state,$city,$buildingno,$roadno";
  }
}

class AddressProvider with ChangeNotifier {
  List<Address> _addresses = [];
  Address? _selectedAddress;
   bool _isLoading = false;
  List<Address> get addresses => _addresses;
  Address? get selectedAddress => _selectedAddress;
  bool get isLoading => _isLoading;
  AddressProvider() {
    print("tapppppp");
    _loadAddresses();
    _loadSelectedAddress();
  }

  void addAddress(Address address) async {
    _addresses.add(address);
    await _saveAddresses();
    notifyListeners();
  }

  void removeAddress(int index) async {
    _addresses.removeAt(index);
    await _saveAddresses();
    notifyListeners();
  }

 void selectAddress(Address? address) async {
  _isLoading = true;
  notifyListeners();  

  if (_selectedAddress == address) {
    _selectedAddress = null;
  } else {
    _selectedAddress = address;
  }
   await _saveSelectedAddress();

  _isLoading = false;
  notifyListeners();  
}




  Future<void> _saveSelectedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    if (_selectedAddress != null) {
      String addressJson = jsonEncode(_selectedAddress!.tojson());
      await prefs.setString("SelectedAddress", addressJson);
      print("Saved Selected Address: $addressJson");
    } else {
      await prefs.remove("SelectedAddress");
      print("Removed Selected Address");
    }
    
  }

  Future<void> _loadSelectedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedAddress = prefs.getString("SelectedAddress");

    if (savedAddress != null) {
      try {
        _selectedAddress = Address.fromJson(jsonDecode(savedAddress));
        print("Loaded Selected Address: $_selectedAddress");
      } catch (e) {
        print(" Error loading selected address: $e");
      }
    } else {
      print("No Selected Address");
    }

    Future.delayed(Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  Future<void> _saveAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> addressList =
        _addresses.map((addr) => jsonEncode(addr.tojson())).toList();
    await prefs.setStringList("addresses", addressList);
  }

  Future<void> _loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? addressList = prefs.getStringList("addresses");
    if (addressList != null) {
      _addresses =
          addressList
              .map((addr) => Address.fromJson(jsonDecode(addr)))
              .toList();
      notifyListeners();
    }
  }

  
}
