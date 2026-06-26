import "@typespec/http";

using Http;

/**
 * Team core API — the follow (subscribe) operation.
 *
 * Subscribes the authenticated user to a team's updates so they receive
 * live notifications when the team's state changes.
 *
 * Auth: requires `Authorization: Bearer <token>`.
 *
 * NOTE: this is an unspecified stub endpoint — the wire shape below is a
 * placeholder, not yet backed by a backstage requirement. Team/player
 * following and notifications are owned by `sports/gameboard-live`; this
 * `follow` operation will be reconciled with that contract when fleshed out.
 */
@route("/v0/api4team")
namespace Team.Api4Team;

/** Request body for following a team. */
model FollowTeamRequest {
  /** The ID of the team to follow. */
  teamID: string;
}

/** Response body returned after a follow operation. */
model FollowTeamResponse {
  /** The ID of the team that was followed. */
  teamID: string;

  /** True if the user is now following the team; false if they were already following. */
  followed: boolean;
}

interface Follows {
  /** Subscribe the current user to a team's updates (idempotent). */
  @post
  @route("/follow")
  follow(@body body: FollowTeamRequest): FollowTeamResponse;
}
