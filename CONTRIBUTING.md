# Contributing to Sentinel Git-OPS

Contributions are welcome through pull requests and focused issue reports.

## Before opening a pull request

1. Keep changes scoped to one problem or feature.
2. Do not commit credentials, private keys, local profiles, or real tokens.
3. Preserve the separation between the platform router, core actions, and i18n resources.
4. Update both `README.md` and `README.pt-br.md` when user-facing behavior changes.
5. Run the repository validation workflow and manually exercise the affected command path when practical.

## Local validation

On Linux/macOS, check Bash syntax with:

```bash
for f in linux/git-ops.sh linux/core/*.sh; do bash -n "$f" || exit 1; done
```

On Windows, parse the PowerShell files using PowerShell's language parser or run the GitHub Actions validation workflow.

## Security-sensitive changes

Do not publish exploit details for an unpatched vulnerability in a public issue. Follow [`SECURITY.md`](SECURITY.md) instead.