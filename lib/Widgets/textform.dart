import 'package:flutter/material.dart';

Widget textFormField(TextEditingController controller,String hint,) {
  return TextFormField(
    controller: controller,
    validator:(value)=> value!.isEmpty ? "Enter value":null,
    decoration: InputDecoration(
        hintText: hint,
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
