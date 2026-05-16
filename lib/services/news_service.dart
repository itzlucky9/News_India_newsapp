import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_application/models/news_model.dart';


class NewsService {

  final String apiKey = "pub_4e2d00db05564f7c942f62b831856624";

  

  Future<List<NewsModel>> fetchNews() async{
    final url = 'https://newsdata.io/api/1/latest?apikey=$apiKey&country=in,au&language=en&category=breaking,business,education,technology,top&image=1&removeduplicate=1';

    final response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final data = jsonDecode(response.body);

      final List results = data['results'];


      return results.map((e) => NewsModel.fromJson(e)).toList();
    }

    throw Exception('Failed to load news');
  }
}


// https://newsdata.io/api/1/latest?apikey=pub_4e2d00db05564f7c942f62b831856624&country=in,au&language=en&category=breaking,business,education,technology,top&image=1&removeduplicate=1