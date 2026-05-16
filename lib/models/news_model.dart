
class NewsModel {
  final String title;
  final String description;
  final String imageUrl;
  final String sourceName;
  final String date;
  final List<String> category;
  final String sourceicon;


  NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.sourceName,
    required this.date,
    required this.category,
    required this.sourceicon,
  });

  factory NewsModel.fromJson(Map<String, dynamic> Json){
    return NewsModel(
      title: Json['title'] ?? "",
      description: Json['description'] ?? "",
      imageUrl: Json['image_url'] ?? "",
      sourceName: Json['source_name'] ?? '',
      date: Json['pubDate'] ?? '',
      category: List<String>.from(
        Json['category'] ?? [],
      ),
      sourceicon: Json['source_icon'] ?? '',
    );
  }
}