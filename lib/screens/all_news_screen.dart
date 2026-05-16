import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/widgets/listviewImages.dart';



class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({
    required this.newsList,
    super.key
  });

  final List<NewsModel> newsList;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Top HeadLines",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 223, 115, 115),
            fontStyle: FontStyle.italic
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.red,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: listViewImages(
            newsList,
            newsList.length
          ),
        )
      ),
    );
  }
}