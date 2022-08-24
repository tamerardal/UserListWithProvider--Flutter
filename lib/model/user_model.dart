class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Map<String, dynamic> toJson() => _$UserToJson(this);

  // @override
  // String toString() =>
  //     'User{userId: $userId, id: $id, title: $title, body: $body}';
}
