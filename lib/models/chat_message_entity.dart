class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      this.imageUrl,
      required this.id,
      required this.createdAt,
      required this.author});
  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json["text"],
        id: json["id"],
        createdAt: json["createdAt"],
        imageUrl: json["image"],
        author: Author.fromJson(json["author"]));
  }
}

class Author {
  String name;
  Author({required this.name});
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(name: json["userName"]);
  }
}
