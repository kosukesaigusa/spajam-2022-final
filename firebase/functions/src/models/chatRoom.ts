export class ChatRoom {
    chatRoomId = ``
    createdByUserId = ``
    appUserIds: string[] = []
    isDeleted = false
    createdAt?: FirebaseFirestore.Timestamp

    constructor(partial?: Partial<ChatRoom>) {
        Object.assign(this, partial)
    }
}
