import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String messageText;
  String email;
  DateTime createdAt;

  MessageModel({
    required this.messageText,
    required this.email,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final createdAtValue = json['createdAt'];

    DateTime createdAtDate;

    if (createdAtValue is Timestamp) {
      createdAtDate = createdAtValue.toDate();
    } else if (createdAtValue is String) {
      createdAtDate = DateTime.parse(createdAtValue);
    } else if (createdAtValue is DateTime) {
      createdAtDate = createdAtValue;
    } else {
      createdAtDate = DateTime.now();
    }

    return MessageModel(
      messageText: json['messageText'] as String,
      email: json['email'] as String,
      createdAt: createdAtDate,
    );
  }
}
