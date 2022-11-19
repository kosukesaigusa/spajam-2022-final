import { FirestoreDataConverter } from '@google-cloud/firestore'
import { AttendingChatRoom } from '../models/attendingChatRoom'

export const attendingChatRoomConverter: FirestoreDataConverter<AttendingChatRoom> = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): AttendingChatRoom {
        const data = qds.data()
        return {
            chatRoomId: qds.id,
            partnerId: data.partnerId,
            isDeleted: data.isDeleted,
            createdAt: data.createdAt,
            updatedAt: data.updatedAt,
        }
    },
    toFirestore(attendingChatRoom: AttendingChatRoom): FirebaseFirestore.DocumentData {
        return {
            chatRoomId: attendingChatRoom.chatRoomId,
            partnerId: attendingChatRoom.partnerId,
            isDeleted: attendingChatRoom.isDeleted,
            createdAt: attendingChatRoom.createdAt,
            updatedAt: attendingChatRoom.updatedAt
        }
    }
}
