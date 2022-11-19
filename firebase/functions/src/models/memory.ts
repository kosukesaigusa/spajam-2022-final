export class Memory {
    memoryId = ``
    partnerId = ``
    imageUrl = ``
    comment = ``
    createdAt?: FirebaseFirestore.Timestamp

    constructor(partial?: Partial<Memory>) {
        Object.assign(this, partial)
    }
}
