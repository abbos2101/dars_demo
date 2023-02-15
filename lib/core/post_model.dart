class PostModel {
  const PostModel._({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.userImage,
    required this.image,
  });

  final int userId;
  final int id;
  final String title;
  final String body;
  final String userImage;
  final String image;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final id = json["id"] ?? 0;
    return PostModel._(
      userId: json["userId"] ?? 0,
      id: id,
      title: json["title"] ?? "",
      body: json["body"] ?? "",
      userImage: "https://randomuser.me/api/portraits/women/$id.jpg",
      image: "https://source.unsplash.com/collection/$id/480x480",
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
