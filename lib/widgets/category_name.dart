import 'package:flutter/material.dart';


Widget CategoryName(String categoryName){
  
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4
    ),
    decoration: BoxDecoration(
      color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(25)
    ),

    child: Text(
      categoryName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 13
      ),
    ),
  );
}