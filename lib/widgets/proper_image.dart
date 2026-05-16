import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/widgets/image_not_found_widget.dart';

Widget ProperImage(NewsModel news) {
  return Container(
    height: 330,
    width: double.infinity,
    padding: EdgeInsets.only(top: 54),
    decoration: BoxDecoration(
      color: const Color.fromARGB(31, 231, 230, 230),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
    child: news.imageUrl.isNotEmpty
        ? Image.network(
            news.imageUrl,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return imageNotFound(330, double.infinity);
            },
          )
        : imageNotFound(330, double.infinity),
  );
}
