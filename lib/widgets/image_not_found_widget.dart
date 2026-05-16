import 'package:flutter/material.dart';

Widget imageNotFound(
  double hg, double wt
){
  return Container(
    color: Colors.grey.shade300,
    height: hg,
    width: wt,
    child: Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: hg==110 ? 10 : 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 148, 135, 135),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "Image Not Found !",
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: hg==110 ? 10 : 16
          ),
        ),
      ),
    ),
  );
}