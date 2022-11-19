import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/app_user.dart';
import '../models/attending_chat_room.dart';
import '../models/chat_room.dart';
import '../models/memory.dart';
import '../models/message.dart';
import '../models/read_status.dart';
import '../models/test_notification_request.dart';
import '../models/todo.dart';

final db = FirebaseFirestore.instance;

/// appUsers コレクションの参照。
final appUsersRef = db.collection('appUsers').withConverter(
  fromFirestore: (ds, _) {
    return AppUser.fromDocumentSnapshot(ds);
  },
  toFirestore: (obj, _) {
    final json = obj.toJson();
    return json;
  },
);

/// appUser ドキュメントの参照。
DocumentReference<AppUser> appUserRef({
  required String appUserId,
}) =>
    appUsersRef.doc(appUserId);

/// testNotificationRequest コレクションの参照。
final testNotificationRequestsRef = db.collection('testNotificationRequests').withConverter(
      fromFirestore: (ds, _) => TestNotificationRequest.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// todo コレクションの参照。
CollectionReference<Todo> todosRef({
  required String appUserId,
}) =>
    appUserRef(appUserId: appUserId).collection('todos').withConverter(
          fromFirestore: (ds, _) => Todo.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// todo ドキュメントの参照。
DocumentReference<Todo> todoRef({
  required String appUserId,
  required String todoId,
}) =>
    todosRef(appUserId: appUserId).doc(todoId);

/// attendingChatRoom コレクションの参照。
CollectionReference<AttendingChatRoom> attendingChatRoomsRef({
  required String appUserId,
}) =>
    appUserRef(appUserId: appUserId).collection('attendingChatRooms').withConverter(
          fromFirestore: (ds, _) => AttendingChatRoom.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// attendingChatRoom ドキュメントの参照。
DocumentReference<AttendingChatRoom> attendingChatRoomRef({
  required String appUserId,
  required String chatRoomId,
}) =>
    attendingChatRoomsRef(appUserId: appUserId).doc(chatRoomId);

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

/// readStatuses コレクションの参照。
CollectionReference<ReadStatus> readStatusesRef({
  required String chatRoomId,
}) =>
    chatRoomRef(chatRoomId: chatRoomId).collection('readStatuses').withConverter<ReadStatus>(
          fromFirestore: (snapshot, _) => ReadStatus.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// readStatus ドキュメントの参照。
DocumentReference<ReadStatus> readStatusRef({
  required String chatRoomId,
  required String readStatusId,
}) =>
    readStatusesRef(chatRoomId: chatRoomId).doc(readStatusId).withConverter<ReadStatus>(
          fromFirestore: (snapshot, _) => ReadStatus.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// memory コレクションの参照。
CollectionReference<Memory> memoriesRef({
  required String appUserId,
}) =>
    appUserRef(appUserId: appUserId).collection('memories').withConverter(
          fromFirestore: (ds, _) => Memory.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// memory ドキュメントの参照。
DocumentReference<Memory> memoryRef({
  required String appUserId,
  required String memoryId,
}) =>
    memoriesRef(appUserId: appUserId).doc(memoryId);
