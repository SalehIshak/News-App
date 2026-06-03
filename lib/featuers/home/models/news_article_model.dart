class NewsArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticleModel.fromjson(Map<String, dynamic> json) {
    return NewsArticleModel(
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"] ?? DateTime.now()),
      content: json["content"] ?? "",
    );
  }

  Map<String, dynamic> toMJson() {
    return {
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "content": content,
    };
  }
}
