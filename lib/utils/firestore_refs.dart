import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/app_user.dart';
import '../models/chat_room.dart';
import '../models/message.dart';
import '../models/test_notification_request.dart';
import '../models/todo.dart';

final db = FirebaseFirestore.instance;

/// appUsers コレクションの参照。
final appUsersRef = db.collection('appUsers').withConverter(
      fromFirestore: (ds, _) => AppUser.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// appUser ドキュメントの参照。
DocumentReference<AppUser> appUserRef({
  required String userId,
}) =>
    appUsersRef.doc(userId);

/// testNotificationRequest コレクションの参照。
final testNotificationRequestsRef = db.collection('testNotificationRequests').withConverter(
      fromFirestore: (ds, _) => TestNotificationRequest.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// todo コレクションの参照。
CollectionReference<Todo> todosRef({
  required String userId,
}) =>
    appUserRef(userId: userId).collection('todos').withConverter(
          fromFirestore: (ds, _) => Todo.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// todo ドキュメントの参照。
DocumentReference<Todo> todoRef({
  required String userId,
  required String todoId,
}) =>
    todosRef(userId: userId).doc(todoId);

/// chatRooms コレクションの参照。
final chatRoomsRef = db.collection('chatRooms').withConverter(
      fromFirestore: (ds, _) => ChatRoom.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// chatRoom ドキュメントの参照。
DocumentReference<ChatRoom> chatRoomRef({
  required String chatRoomId,
}) =>
    chatRoomsRef.doc(chatRoomId);

/// messages コレクションの参照。
CollectionReference<Message> messagesRef({
  required String chatRoomId,
}) =>
    chatRoomRef(chatRoomId: chatRoomId).collection('messages').withConverter(
          fromFirestore: (ds, _) => Message.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// message ドキュメントの参照。
DocumentReference<Message> messageRef({
  required String chatRoomId,
  required String messageId,
}) =>
    messagesRef(chatRoomId: chatRoomId).doc(messageId);
