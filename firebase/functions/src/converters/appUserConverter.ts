import { FirestoreDataConverter } from '@google-cloud/firestore'
import { AppUser } from '../models/appUser'

export const appUserConverter: FirestoreDataConverter<AppUser> = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): AppUser {
        const data = qds.data()
        return {
            appUserId: qds.id,
            name: data.name,
            imageUrl: data.imageUrl,
            country: data.country,
            isVisible: data.isVisible,
            flags: data.flags,
            comment: data.comment,
            // 位置情報に関しては使用しない
            fcmTokens: data.fcm,

        }
    },
    toFirestore(appUser: AppUser): FirebaseFirestore.DocumentData {
        return {
            appUserId: appUser.appUserId,
            name: appUser.name,
            imageUrl: appUser.imageUrl,
            country: appUser.country,
            isVisible: appUser.isVisible,
            flags: appUser.flags,
            comment: appUser.comment,
            // 位置情報に関しては使用しない
            fcmTokens: appUser.fcmTokens
        }
    }
}
