import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/widgets/listviewImages.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    required this.newsList,
    super.key
  });

  final List<NewsModel> newsList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<NewsModel> filteredNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredNews = widget.newsList;
  }

  void searchNews(String value){
    final result = widget.newsList.where((news){
      return news.title.toLowerCase().contains(value.toLowerCase());
    }).toList();

    setState(() {
      filteredNews = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 22.0,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    child: TextField(
                      onChanged: searchNews,
                      decoration: InputDecoration(
                        hintText: "Search news...",
                        suffixIcon: Icon(
                          Icons.search,
                          size: 22.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10,),
          
              Expanded(
                child: listViewImages(
                  filteredNews,
                  filteredNews.length
                ),
              )
            ],
          ),
        ))
    );
  }
}