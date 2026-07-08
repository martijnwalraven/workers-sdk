---
"wrangler": patch
---

Derive `nodejsCompatMode` from the resolved config in `unstable_startWorker()`

The CLI computes the node-compat mode from the configuration's `compatibility_date` and `compatibility_flags`, but the programmatic path used `input.build.nodejsCompatMode` raw — leaving it unset meant a worker's own `nodejs_compat` flag was silently ignored, so bundling failed to resolve node builtins that `wrangler dev` handles. `startWorker` now derives the mode from the resolved config when the caller does not provide one; passing an explicit `null` still disables it.
