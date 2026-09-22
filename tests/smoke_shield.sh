#!/usr/bin/env bash
set -euo pipefail

TMP_DIR="$(mktemp -d)"
cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

cd "$TMP_DIR"
git init -q
 git config user.email "test@example.invalid"
 git config user.name "Sentinel Test"
printf '%s\n' 'initial' > README.md
git add README.md
git commit -qm initial

cat > .git/hooks/pre-commit <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
PATTERNS=(
    "-----BEGIN (RSA |EC |OPENSSH |DSA )?PRIVATE KEY-----"
    "ghp_[0-9a-zA-Z]{36}"
    "github_pat_[0-9A-Za-z_]{22,}"
    "AKIA[0-9A-Z]{16}"
    "xox[baprs]-[0-9a-zA-Z-]{10,48}"
)
while IFS= read -r -d '' FILE; do
    for PATTERN in "${PATTERNS[@]}"; do
        if git diff --cached -- "$FILE" | grep -Eiq -- "$PATTERN"; then
            exit 1
        fi
    done
done < <(git diff --cached --name-only --diff-filter=ACMR -z)
EOF
chmod +x .git/hooks/pre-commit

printf '%s\n' 'ghp_AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' > 'file with spaces.txt'
git add 'file with spaces.txt'
if git commit -qm should-be-blocked; then
  echo 'Shield smoke test failed: secret pattern was not blocked.' >&2
  exit 1
fi

git reset -q
git clean -qfd
printf '%s\n' 'safe content' > 'file with spaces.txt'
git add 'file with spaces.txt'
git commit -qm safe

echo 'Shield smoke test: OK'