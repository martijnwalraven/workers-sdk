#!/bin/sh
# Callboard fork-consumption build: wrangler built and packed as a tarball
# the Callboard monorepo's pnpm override points at (pnpm pack rewrites
# workspace:* deps to real versions). Integration-branch-only tooling —
# never part of the upstream PR branches.
set -e
cd "$(dirname "$0")"
PATH="$HOME/.cache/corepack-shims:$PATH"
export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
pnpm exec turbo build --filter wrangler --filter miniflare
mkdir -p dist-callboard
(cd packages/miniflare && pnpm pack --out ../../dist-callboard/miniflare-callboard.tgz)
(cd packages/wrangler && pnpm pack --out ../../dist-callboard/wrangler-callboard.tgz)
echo "packed: $(pwd)/dist-callboard/{wrangler,miniflare}-callboard.tgz"
