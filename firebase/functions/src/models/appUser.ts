export class AppUser {
    appUserId = ``
    name = ``
    imageUrl = ``
    country = ``
    isVisible = ``
    flags: string[] = []
    comment = ``
    // 位置情報に関しては使用しない
    fcmTokens: string[] = []

    constructor(partial?: Partial<AppUser>) {
        Object.assign(this, partial)
    }
}
