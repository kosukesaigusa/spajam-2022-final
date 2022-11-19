import { FieldValue } from '@google-cloud/firestore'
import * as functions from 'firebase-functions'
import { attendingChatRoomRef } from '~/src/firestore-refs/firestoreRefs'
import { messageConverter } from '../../converters/messageConverter'
import { AppUserRepository } from '../../repositories/appUser'
import { ChatRoomRepository } from '../../repositories/chatRoom'
import { sendFCMByUserIds } from '../../utils/fcm/sendFCMNotification'

/**
 * 新しい message ドキュメントが作成されたときに発火する。
 * 該当者 2 人の attendingChatRoom にドキュメントを更新して、FCM で通知を送る。
 */
export const onCreateMessage = functions
    .region(`asia-northeast1`)
    .firestore.document(`/chatRooms/{chatRoomId}/messages/{messageId}`)
    .onCreate(async (snapshot, context) => {
        const chatRoomId = context.params.chatRoomId
        const chatRoomRepository = new ChatRoomRepository()
        const chatRoom = await chatRoomRepository.fetchChatRoom({ chatRoomId })
        if (chatRoom === undefined) {
            functions.logger.error(`ChatRoom が見つかりませんでした。`)
            return
        }
        const message = messageConverter.fromFirestore(snapshot)
        const senderUserId = message.senderId
        const appUserRepository = new AppUserRepository()
        const sender = await appUserRepository.fetchAppUser({ appUserId: senderUserId })
        if (sender === undefined) {
            functions.logger.error(`メッセージの送信者が見つかりませんでした`)
            return
        }
        const appUserIds = chatRoom.appUserIds
        const receiverUserId = appUserIds.splice(appUserIds.indexOf(senderUserId))[0]
        try {
            await attendingChatRoomRef({ appUserId: receiverUserId, chatRoomId }).update({
                updatedAt: FieldValue.serverTimestamp()
            })
            await sendFCMByUserIds({
                userIds: [receiverUserId],
                title: `${sender.name}さんからメッセージ`,
                body: message.message,
                location: `/chatRooms/${chatRoomId}`
            })
        } catch (e) {
            functions.logger.error(`chatRoom ドキュメントの作成に伴う attendingChatRoom の作成に失敗しました。${e}`)
        }
    })
