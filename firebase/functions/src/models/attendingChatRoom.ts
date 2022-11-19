export class AttendingChatRoom {
    chatRoomId = ``
    partnerId = ``
    isDeleted = false
    createdAt?: FirebaseFirestore.Timestamp
    updatedAt?: FirebaseFirestore.Timestamp

    constructor(partial?: Partial<AttendingChatRoom>) {
        Object.assign(this, partial)
    }
}
