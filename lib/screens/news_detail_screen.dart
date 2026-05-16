import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/widgets/image_not_found_widget.dart';
import 'package:news_application/widgets/overlay.dart';
import 'package:news_application/widgets/proper_image.dart';


class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    required this.news,
    super.key
    });

    final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: height * 0.55,
            width: double.infinity,
            child: news.imageUrl.isNotEmpty
        ? Image.network(
            news.imageUrl,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return imageNotFound(height * 0.55, double.infinity);
            },
          )
        : imageNotFound(height * 0.55, double.infinity),
          ),

          Container(
            height: height * 0.55,
            width: double.infinity,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.8)
                ])
            ),
          ),

          // Top Content
          SafeArea(
            child: SizedBox(
              height: height * 0.55,
              child: Padding(
                padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.015,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          shape: CircleBorder(),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Ink(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                shape: BoxShape.circle
                              ),
                            
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
              
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                shape: BoxShape.circle
                              ),
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              ),
                            ),
              
                            SizedBox(width: 10,),
              
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
              
                    // PUSH CONTENT DOWN
                    Spacer(),
              
                    // Category
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 14,
                      ),
              
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        news.category[0][0].toUpperCase() + news.category[0].substring(1).toLowerCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
              
                    SizedBox(height: height * 0.02,),
              
                    // Title
                    Text(
                      news.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              
                    SizedBox(height: 10,),
              
                    Text(
                      news.date.split(" ")[0],
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.white70
                      ),
                    ),
              
                    SizedBox(height:height * 0.08,),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,

            child: Container(
              height: height * 0.5,
              width: double.infinity,
              padding: EdgeInsets.all(width * 0.06),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          child: ClipOval(
                            child: Image.network(
                              news.sourceicon,
                              width: 44,
                              height: 44,
                              fit: BoxFit.cover,
                            
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.newspaper);
                              },
                            ),
                          ),
                        ),

                        SizedBox(width: 12,),

                        Flexible(
                          child: Text(
                            news.sourceName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        SizedBox(width: 8,),
                        Icon(
                          Icons.verified_rounded,
                          color: Colors.blue,
                        )
                      ],
                    ),

                    const SizedBox(height: 25,),

                    // Content 
                    SelectableText(
                      news.description,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.8,
                        color: Colors.black87
                      ),
                    )
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}