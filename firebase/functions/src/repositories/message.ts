import { messageRef, messagesRef } from '../firestore-refs/firestoreRefs'
import { Message } from '../models/message'

/** Message のリポジトリクラス */
export class MessageRepository {
    /** 指定したChatRoomの Message 一覧を取得する。 */
    async fetchMessages({ chatRoomId }: { chatRoomId: string }): Promise<Message[]> {
        const qs = await messagesRef({ chatRoomId: chatRoomId }).get()
        return qs.docs.map((a) => a.data())
    }

    async fetchMessage({ chatRoomId, messageId }: { chatRoomId: string; messageId: string }): Promise<Message | undefined> {
        const ds = await messageRef({ chatRoomId: chatRoomId, messageId: messageId }).get()
        return ds.data()
    }
}
