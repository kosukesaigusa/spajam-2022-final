import { FirestoreDataConverter } from '@google-cloud/firestore'
import { ChatRoom } from '../models/chatRoom'

export const chatRoomConverter: FirestoreDataConverter<ChatRoom> = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): ChatRoom {
        const data = qds.data()
        return {
            chatRoomId: qds.id,
            createdByUserId: data.createdByUserId,
            appUserIds: data.appUserIds,
            isDeleted: data.isDeleted,
            createdAt: data.createdAt
        }
    },
    toFirestore(chatRoom: ChatRoom): FirebaseFirestore.DocumentData {
        return {
            chatRoomId: chatRoom.chatRoomId,
            createdByUserId: chatRoom.createdByUserId,
            appUserIds: chatRoom.appUserIds,
            isDeleted: chatRoom.isDeleted,
            createdAt: chatRoom.createdAt
        }
    }
}
