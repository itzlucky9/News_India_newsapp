import 'package:flutter/material.dart';


Widget overlay(double hg){
  return Container(
    height: hg,
    width: double.infinity,

    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(hg==330?0.2 : 0.85)
        ],
      )
    ),
  );
}