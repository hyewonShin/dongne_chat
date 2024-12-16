import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String roomId;
  final String address;
  final String title;
  final String info;
  final String category;
  final List<int> users;
  // final String createdUser;
  final DateTime createdAt;

  ChatRoom({
    required this.roomId,
    required this.address,
    required this.title,
    required this.info,
    required this.category,
    required this.users,
    // required this.createdUser,
    required this.createdAt,
  });

  factory ChatRoom.fromJson(DocumentSnapshot doc) {
    return ChatRoom(
        roomId: doc.id,
        address: doc['address'] ?? '',
        title: doc['title'] ?? '',
        info: doc['info'] ?? '',
        category: doc['category'] ?? '전체',
        users: List<int>.from(doc['users']),
        // createdUser: json['created_user'],
        createdAt: (doc['createdAt'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'address': address,
      'title': title,
      'info': info,
      'category': category,
      'users': users,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}