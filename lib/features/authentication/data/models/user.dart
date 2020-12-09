class User {
  final String userID;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  String profileImageURL;
  final String bio;
  final String location;

  User({
    this.userID,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImageURL,
    this.bio,
    this.location,
  });

  factory User.fromMap(Map doc) {
    return User(
      userID: doc["userID"],
      username: doc["username"],
      firstName: doc["firstName"],
      lastName: doc["lastName"],
      email: doc["email"],
      profileImageURL: doc["profileImageURL"],
      bio: doc["bio"],
      location: doc["location"],
    );
  }
}
