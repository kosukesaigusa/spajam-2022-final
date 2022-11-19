import { attendingChatRoomRef, attendingChatRoomsRef } from '../firestore-refs/firestoreRefs'
import { AttendingChatRoom } from '../models/attendingChatRoom'

/** AttendingChatRoom のリポジトリクラス */
export class AttendingChatRoomRepository {
    /** 指定したAppUserの AttendingChatRoom 一覧を取得する。 */
    async fetchAttendingChatRooms({ appUserId }: { appUserId: string }): Promise<AttendingChatRoom[]> {
        const qs = await attendingChatRoomsRef({ appUserId: appUserId }).get()
        return qs.docs.map((a) => a.data())
    }

    async fetchAttendingChatRoom({
        appUserId,
        chatRoomId,
    }: {
        appUserId: string
        chatRoomId: string
    }): Promise<AttendingChatRoom | undefined> {
        const ds = await attendingChatRoomRef({ appUserId: appUserId, chatRoomId: chatRoomId }).get()
        return ds.data()
    }
}
