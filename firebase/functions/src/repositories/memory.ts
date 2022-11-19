import { memoriesRef, memoryRef } from '../firestore-refs/firestoreRefs'
import { Memory } from '../models/memory'

/** Memory のリポジトリクラス */
export class MemoryRepository {
    /** 指定したAppUserの Memory 一覧を取得する。 */
    async fetchMemories({
        appUserId
    }: {
        appUserId: string
    }): Promise<Memory[]> {
        const qs = await memoriesRef({ appUserId: appUserId }).get()
        return qs.docs.map((a) => a.data())
    }

    async fetchMemory({
        appUserId,
        memoryId
    }: {
        appUserId: string
        memoryId: string
    }): Promise<Memory | undefined> {
        const ds = await memoryRef({ appUserId: appUserId, memoryId: memoryId }).get()
        return ds.data()
    }
}
