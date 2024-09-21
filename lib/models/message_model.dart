import 'package:chat_app/constants.dart';

class MessageModel {
  final String message;

  MessageModel({required this.message});

  factory MessageModel.fromJson(json) {
    return MessageModel(message: json[kMessage]);
  }
}
