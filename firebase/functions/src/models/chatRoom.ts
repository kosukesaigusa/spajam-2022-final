export class ChatRoom {
    chatRoomId = ``
    appUserIds: string[] = []
    isDeleted = false
    createdAt?: FirebaseFirestore.Timestamp

    constructor(partial?: Partial<ChatRoom>) {
        Object.assign(this, partial)
    }
}
