import * as functions from 'firebase-functions'
import { attendingChatRoomRef } from '~/src/firestore-refs/firestoreRefs'
import { chatRoomConverter } from '../../converters/chatRoomConverter'
import { AttendingChatRoom } from '../../models/attendingChatRoom'
import { AppUserRepository } from '../../repositories/appUser'
import { sendFCMByUserIds } from '../../utils/fcm/sendFCMNotification'

/**
 * 新しい chatRoom ドキュメントが作成されたときに発火する。
 * 作成主ではない方のユーザーの attendingChatRoom ドキュメントを作成し、FCM で通知を送る。
 */
export const onCreateChatRoom = functions
    .region(`asia-northeast1`)
    .firestore.document(`/chatRooms/{chatRoomId}`)
    .onCreate(async (snapshot, context) => {
        const chatRoom = chatRoomConverter.fromFirestore(snapshot)
        const chatRoomId = chatRoom.chatRoomId
        const appUserIds = chatRoom.appUserIds
        const requesterUserId = context.auth?.uid ?? ``
        const appUserRepository = new AppUserRepository()
        const requesterUser = await appUserRepository.fetchAppUser({ appUserId: requesterUserId })
        if (requesterUser === undefined) {
            functions.logger.error(`ChatRoom を作成したユーザーが見つかりませんでした。`)
            return
        }
        const requestedUserId = appUserIds.splice(appUserIds.indexOf(requesterUserId))[0]
        const attendingChatRoom = new AttendingChatRoom({ chatRoomId, partnerId: requestedUserId })
        try {
            await attendingChatRoomRef({ appUserId: requesterUserId, chatRoomId }).set(attendingChatRoom)
            await sendFCMByUserIds({
                userIds: [requestedUserId],
                title: `${requesterUser.name}さんが近くにいるようです！`,
                body: `国際交流のチャンス！${requesterUser.name}さんから連絡が届きました！`,
                location: `/chatRooms/${chatRoomId}`
            })
        } catch (e) {
            functions.logger.error(`chatRoom ドキュメントの作成に伴う attendingChatRoom の作成に失敗しました。${e}`)
        }
    })
