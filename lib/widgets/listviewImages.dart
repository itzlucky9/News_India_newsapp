import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/screens/news_detail_screen.dart';
import 'package:news_application/widgets/image_not_found_widget.dart';

Widget listViewImages(List<NewsModel> newsList, int lg) {
  return ListView.builder(
    itemCount: lg,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (_)=> NewsDetailScreen(news: newsList[index]))
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
        
                child: newsList[index].imageUrl.isNotEmpty
                    ? Image.network(
                        newsList[index].imageUrl,
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return imageNotFound(110, 110);
                        },
                      )
                    : imageNotFound(110, 110),
              ),
        
              const SizedBox(width: 20),
        
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsList[index].category[0][0].toUpperCase() +
                          newsList[index].category[0].substring(1).toLowerCase(),
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
        
                    const SizedBox(height: 4),
        
                    Text(
                      newsList[index].title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
        
                    const SizedBox(height: 4),
        
                    Text(newsList[index].date.split(" ")[0]),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
