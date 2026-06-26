import "@typespec/http";
import "./api4team.tsp";

using Http;

/**
 * Team HTTP/JSON API.
 *
 * sneat.team is the club/team management vertical of the Sneat ecosystem
 * (clubs, teams, rosters, coaches, profiles). This contract is currently a
 * skeleton exposing only a `follow` stub; the management surface is added as
 * it is specified.
 *
 * These TypeSpec files are the **frozen wire contract** between the Go backend
 * (`sneat-team-ext/backend`) and the Angular frontend (`@sneat/extension-team-contract`).
 * No emitters are configured — the `.tsp` is the source of truth for the wire
 * shape; both sides hand-implement matching types (same convention as
 * `eventus/typespec` and the `sneat-go/typespec` directory).
 *
 * Source spec: backstage `spec/features/sports/sneat-team`.
 */
@service(#{ title: "Team API" })
namespace Team;
