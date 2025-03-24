import 'package:flutter/material.dart';

Widget   buttons(BuildContext context, String text) {
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