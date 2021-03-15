class HotPost {
  final String lessonTitle;
  final String postID;
  final String recordingURL;
  final String uid;

  HotPost({this.lessonTitle, this.postID, this.recordingURL, this.uid});

  factory HotPost.fromMap(Map doc) {
    return HotPost(
      lessonTitle: doc["lessonTitle"],
      postID: doc["postID"],
      uid: doc["uid"],
      recordingURL: doc["recordingURL"],
    );
  }
}
