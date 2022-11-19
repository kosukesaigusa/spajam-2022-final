import { FirestoreDataConverter } from '@google-cloud/firestore'
import { Message } from '../models/message'

export const messageConverter: FirestoreDataConverter<Message> = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): Message {
        const data = qds.data()
        return {
            messageId: qds.id,
            senderId: data.senderId,
            message: data.message,
            createdAt: data.createdAt
        }
    },
    toFirestore(message: Message): FirebaseFirestore.DocumentData {
        return {
            messageId: message.messageId,
            senderId: message.senderId,
            message: message.message,
            createdAt: message.createdAt
        }
    }
}
