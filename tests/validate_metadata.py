import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

required_files = [
    "CITATION.cff", ".zenodo.json", "LICENSE", "SECURITY.md",
    "README.md", "README.pt-br.md", ".gitattributes", ".gitignore",
]
for name in required_files:
    assert (ROOT / name).is_file(), f"Missing required file: {name}"

meta = json.loads((ROOT / ".zenodo.json").read_text(encoding="utf-8"))
assert meta["upload_type"] == "software"
assert meta["access_right"] == "open"
assert meta["license"].lower() == "mit"
assert meta["version"] == "2.3.1"
assert meta["creators"][0]["name"] == "Chavatte, João Carlos"

cff = (ROOT / "CITATION.cff").read_text(encoding="utf-8")
for needle in [
    "cff-version: 1.2.0", "type: software", "version: 2.3.1",
    "license: MIT", 'family-names: "Chavatte"', 'given-names: "João Carlos"'
]:
    assert needle in cff, f"CITATION.cff missing expected field: {needle}"

for path in ROOT.joinpath("linux").rglob("*.sh"):
    assert b"\r" not in path.read_bytes(), f"CRLF detected in Bash script: {path.relative_to(ROOT)}"

print("Metadata validation: OK")