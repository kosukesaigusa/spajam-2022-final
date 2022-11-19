export class Message {
    messageId = ``
    senderId = ``
    message = ``
    createdAt?: FirebaseFirestore.Timestamp

    constructor(partial?: Partial<Message>) {
        Object.assign(this, partial)
    }
}
