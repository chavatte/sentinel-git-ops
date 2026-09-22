# Security Policy

## Scope

This policy covers Sentinel Git-OPS source code, bundled shell/PowerShell scripts, the optional Shield pre-commit hook, and project-maintained documentation that may affect secure operation.

## Supported Version

The current release line is `2.3.x`. Security reports should include the exact version or commit affected.

## Reporting a Vulnerability

Please do **not** disclose an unpatched vulnerability in a public GitHub issue. Send a private report to **chavatte@duck.com**.

Include, when available:

- affected version or commit;
- operating system and shell/PowerShell version;
- reproduction steps or a minimal proof of concept;
- expected and observed behavior;
- security impact and any known workaround.

Do not include real credentials, private keys, access tokens, or other sensitive information in a report. Redact secrets from logs and proof-of-concept material.

## Scope Examples

Relevant reports include command injection, unsafe profile modification, credential disclosure, path handling that changes security behavior, malicious remote handling, or secret-scanning bypasses that create misleading security guarantees.

## Public Disclosure

After a fix is prepared and coordinated, the project may publish a security note describing affected versions, impact, mitigation, and fixed version.

## Security Limitations

The Shield feature is a small pattern-based pre-commit check. It is not a comprehensive secret scanner and may miss secret formats or flag benign text. It can also be bypassed with Git options such as `--no-verify`.
