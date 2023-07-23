class MessageModel {
  MessageModel({
    required this.msg,
    required this.toID,
    required this.read,
    required this.type,
    required this.fromID,
    required this.sent,
  });
  late final String msg;
  late final String toID;
  late final String read;
  late final String fromID;
  late final String sent;
  late final MsgType type;

  MessageModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'].toString();
    toID = json['toID'].toString();
    read = json['read'].toString();
    type = json['type'].toString() == MsgType.file.name
        ? MsgType.file
        : MsgType.text;
    fromID = json['fromID'].toString();
    sent = json['sent'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    data['toID'] = toID;
    data['read'] = read;
    data['type'] = type.name;
    data['fromID'] = fromID;
    data['sent'] = sent;
    return data;
  }
}

enum MsgType { file, text, offer }
