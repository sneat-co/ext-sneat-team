# sneat-team-ext

Public **contract surface** for the `team` extension — the frozen, cross-repo boundary of
the **sneat.team** vertical. It follows the
[`extension-contract-repo`](https://github.com/sneat-co/sneat-libs/blob/main/spec/features/extension-contract-repo/README.md)
convention (mirrors [`gameboard-ext`](https://github.com/sneat-co/gameboard-ext)).

It holds only what the apps, the private `sneat-team` impl repo, and other extensions need in order
to *talk to* team — the TypeSpec wire contract, Go facade interfaces / DTOs / model shapes, and
the TS contract types. It contains **no** team implementation (that lives in the private
`sneat-co/sneat-team` repo).

## Current scope

Skeleton stub only: **`POST /v0/api4team/follow`** — subscribes the authenticated user to a
team's updates. No other operations are defined yet.

## Layout

```
sneat-team-ext/
├── typespec/   # api4team.tsp — the frozen wire contract (source of truth)
├── backend/    # Go module github.com/sneat-co/sneat-team-ext/backend (hand-implemented to match the .tsp)
└── frontend/   # lib published as @sneat/extension-team-contract (hand-implemented to match the .tsp)
```

## TypeSpec is the source of truth (no emitters)

Per the established house convention (`eventus/typespec`, `sneat-go/typespec`), the `.tsp` files are
the **frozen wire contract** and **no code emitters are configured**. The Go (`backend/`) and TS
(`frontend/`) sides **hand-implement matching types** against the `.tsp`. Shape/parity tests keep the
two language bindings in agreement with the contract.

## The load-bearing invariant

`sneat-team-ext` depends **only on foundational/core code — never on another extension.** Because it
has no edge back to any sibling, `sibling → sneat-team-ext` can never form a dependency cycle. An
interface or type belongs here **only if its entire signature is expressible in team-own +
foundational/core types**. The CI check in `.github/workflows/ci.yml`
(`scripts/check-no-extension-deps.sh`) enforces the invariant.

## Source spec

Backstage feature tree [`sports/sneat-team`](https://github.com/sneat-co/backstage/tree/main/spec/features/sports/sneat-team).

## Local consumption

The main `sneat-team` implementation repo consumes `@sneat/extension-team-contract` from this repo.
The exact consumption mechanism (npm publish vs. local path link) is TBD; the Go module is consumed
via standard `go get github.com/sneat-co/sneat-team-ext/backend` once published.
