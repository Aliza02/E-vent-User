class ChatUser {
  ChatUser({
    required this.name,
    required this.about,
    required this.lastActive,
    required this.id,
    required this.isOnline,
    required this.pushToken,
    required this.email,
  });
  late String name;
  late String about;
  late String lastActive;
  late String id;
  late bool isOnline;
  late String pushToken;
  late String email;

  ChatUser.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    about = json['about'] ?? '';
    lastActive = json['last_active'] ?? '';
    id = json['id'] ?? '';
    isOnline = json['is_online'] ?? '';
    pushToken = json['push_token'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['about'] = about;
    data['last_active'] = lastActive;
    data['id'] = id;
    data['is_online'] = isOnline;
    data['push_token'] = pushToken;
    data['email'] = email;
    return data;
  }
}
