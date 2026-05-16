import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/screens/all_news_screen.dart';
import 'package:news_application/screens/search_screen.dart';
import 'package:news_application/services/news_service.dart';
import 'package:news_application/widgets/image_not_found_widget.dart';
import 'package:news_application/widgets/category_name.dart';
import 'package:news_application/widgets/listviewImages.dart';
import 'package:news_application/widgets/overlay.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsModel> newsList = [];


  Future<void> getNews() async{
    NewsService newsService = NewsService();

    List<NewsModel> data = await newsService.fetchNews();

    setState(() {
      newsList = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 120,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20),

                child: Center(
                  child: Text(
                    "News App",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (_)=> HomeScreen())
                  );
                },
                child: Ink(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                ),
              ),

              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text("BookMark"),
              ),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        return Material(
                          color: Colors.transparent,
                          shape: CircleBorder(),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Ink(
                              height: 40,
                              width: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                            
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black,
                                //     blurRadius: 10,
                                //     offset: const Offset(0, 4)
                                //   )
                                // ]
                              ),
                              child: Icon(
                                Icons.menu,
                                size: 22,
                              ),
                            ),
                          ),
                        );
                      }
                    ),
        
                    Row(
                      children: [
        
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (_) => SearchScreen(newsList: newsList))
                            );
                          },
                          child: Ink(
                            height: 40,
                            width: 40,
                                  
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                                  
                            child: Icon(
                              Icons.search_rounded,
                              size: 22,
                            ),
                          ),
                        ),
        
                        const SizedBox(width: 12.0,),
        
                        Container(
                          height: 40,
                          width: 40,
        
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
        
                          ),
                          child: Icon(
                            Icons.notifications_none_sharp,
                            size: 22,
                          ),
                        )
                      ],
                    )
                  ],
                ),
        
                const SizedBox(height: 30,),
        
        
                /// Breking News 
                
                const Text(
                  "Breaking News",
        
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
        
                const SizedBox(height: 20,),
        
                newsList.isEmpty ? Center(
                  child: CircularProgressIndicator(),
                ) 
                : CarouselSlider.builder(
                  itemCount: newsList.length > 3 ? 3 : newsList.length, 
                  itemBuilder: (context,index,realIndex){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      
                      child: Stack(
                        children: [
                          newsList[index].imageUrl.isNotEmpty ? Image.network(
                          newsList[index].imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 250,
                          errorBuilder: (context, error, stackTrace){
                            return imageNotFound(250,double.infinity);
                          },
                          ) : imageNotFound(250,double.infinity),
        
                          overlay(250),
        
                          Positioned(
                            top: 12,
                            left: 12.0,
                            child: CategoryName(
                              newsList[index].category.isNotEmpty ? newsList[index].category[0] : "News"
                            )
                          ),
        
                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
        
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.public,
                                      color: Colors.white70,
                                      size: 16,
                                    ),
        
                                    const SizedBox(width: 6,),
        
                                    Expanded(
                                      child: Text(
                                        newsList[index].sourceName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13
                                        ),
                                      ),
                                    ),
        
                                    const SizedBox(width: 10,),
        
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white70,
                                      size: 16,
                                    ),
        
                                    const SizedBox(width: 4,),
        
                                    Text(
                                      newsList[index].date.split(" ")[0],
                                      style: TextStyle(
                                        color: const Color.fromARGB(179, 255, 230, 230),
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
        
                                const SizedBox(height: 6,),
        
                                Text(
                                  newsList[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3
                                  ),
                                )
                              ],
                            )
                          )
        
        
                        ]
                      ) ,
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                    enableInfiniteScroll: true,
                  )
                ),
        
                const SizedBox(height: 40,),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommendation",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900
                      ),
                    ),
        
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (_) => AllNewsScreen(newsList: newsList))
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w800,
                        ),
        
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 10,),
        
                listViewImages(
                  newsList, 
                  newsList.length > 6 ? 6 : newsList.length
                )
              ],
        
              
            ),
          ),
        ),
      ),
    );
  }
}