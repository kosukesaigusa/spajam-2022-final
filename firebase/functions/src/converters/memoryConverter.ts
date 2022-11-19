import { FirestoreDataConverter } from '@google-cloud/firestore'
import { Memory } from '../models/memory'

export const memoryConverter: FirestoreDataConverter<Memory> = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): Memory {
        const data = qds.data()
        return {
            memoryId: qds.id,
            partnerId: data.partnerId,
            imageUrl: data.imageUrl,
            comment: data.comment,
            createdAt: data.createdAt
        }
    },
    toFirestore(memory: Memory): FirebaseFirestore.DocumentData {
        return {
            memoryId: memory.memoryId,
            partnerId: memory.partnerId,
            imageUrl: memory.imageUrl,
            comment: memory.comment,
            createdAt: memory.createdAt
        }
    }
}
