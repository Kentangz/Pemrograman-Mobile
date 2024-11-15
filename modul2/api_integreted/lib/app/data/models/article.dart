class Article {
  String title;
  String? author;
  String? urlToImage;
  String url;

  // Constructor
  Article({
    required this.title,
    this.author,
    this.urlToImage,
    required this.url,
  });

  // Factory method untuk mengonversi JSON menjadi objek Article
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      author: json['author'],
      urlToImage: json['urlToImage'],
      url: json['url'],
    );
  }

  // Method untuk mengonversi objek Article kembali menjadi JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'urlToImage': urlToImage,
      'url': url,
    };
  }
}
