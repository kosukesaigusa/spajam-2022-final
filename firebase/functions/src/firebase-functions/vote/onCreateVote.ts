import * as functions from 'firebase-functions'
import { VoteRepository } from '~/src/repositories/vote'
import { VotingEventRepository } from '~/src/repositories/votingEvent'
import { completeVotingEvent } from '~/src/utils/vote'

/**
 * 新しい vote ドキュメントが作成されたときに発火する。
 * - 全員がvoteしたかを確認
 *  - 全員でない場合：
 *      - 何もしない
 *  - 全員終わった場合：
 *      - 算出ロジックを実行
 *      - その返り値でvotingEvent.resultを更新
 *      - votingEvent.votingUserIdsにプッシュ通知を送る (resultも一緒に？)
 *      - 新しいvotingEventドキュメントを作成する
 */
export const onCreateVote = functions
    .region(`asia-northeast1`)
    .firestore.document(`/rooms/{roomId}/votingEvents/{votingEventId}/votes/{voteId}`)
    .onCreate(async (_, context) => {
        const { roomId, votingEventId } = context.params
        // votingEventのuserIdsを取得
        const votingEventRepository = new VotingEventRepository()
        const votingEvent = await votingEventRepository.fetchVotingEvent({ roomId, votingEventId })
        if (votingEvent === undefined) {
            functions.logger.error(
                `指定のVotingEventが存在しません: { roomId: ${roomId}, votingEventId: ${votingEventId} }`
            )
            return
        }
        const userIds = votingEvent.votingUserIds
        // votesのドキュメント数を取得
        const voteRepository = new VoteRepository()
        const votes = await voteRepository.fetchVotes({ roomId, votingEventId })
        // 比較
        if (votes.length < userIds.length) {
            functions.logger.info(`まだ全員の回答が終わっていないので終了します。`)
            return
        }
        functions.logger.info(`全員の回答が終わりました、結果を算出します。`)

        await completeVotingEvent({ votes, roomId, votingEventId, userIds })
    })
