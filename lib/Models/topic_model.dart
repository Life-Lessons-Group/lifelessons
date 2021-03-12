class Topic {
  final String title;
  final String id;

  Topic({this.title, this.id});

  factory Topic.fromMap(Map doc) {
    return Topic(
      title: doc["title"],
      id: doc["id"],
    );
  }
}
