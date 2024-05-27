class Quote {
  final String? title;
  final String? subTitle;
  final String? author;

  Quote({
    required this.title,
    required this.subTitle,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      title: json['title'],
      subTitle: json['sub_title'],
      author: json['author'],
    );
  }
}
