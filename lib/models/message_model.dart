import 'package:flutter/material.dart';

@immutable
class MessageModel {
  const MessageModel({
    required this.senderName,
    required this.message,
    required this.messageDate,
    required this.dateMessageUI,
    required this.profileImageUrl,
  });

  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dateMessageUI;
  final String profileImageUrl;
}
