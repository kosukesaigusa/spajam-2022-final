import { chatRoomRef } from '../firestore-refs/firestoreRefs'
import { ChatRoom } from '../models/chatRoom'

/** ChatRoom のリポジトリクラス */
export class ChatRoomRepository {
    /** 指定した ChatRoom を取得する。 */
    async chatRoomUser({ chatRoomId }: { chatRoomId: string }): Promise<ChatRoom | undefined> {
        const ds = await chatRoomRef({ chatRoomId: chatRoomId }).get()
        return ds.data()
    }
}
