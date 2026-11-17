#!/usr/bin/env bash
# Installe le style « Couleurs » pour Claude Code et l'active dans toutes les sessions.
set -e
REPO_RAW="${REPO_RAW:-https://raw.githubusercontent.com/UTILISATEUR/couleurs-terminal/main}"

mkdir -p "$HOME/.claude/output-styles"
curl -fsSL "$REPO_RAW/output-styles/couleurs.md" -o "$HOME/.claude/output-styles/couleurs.md"
echo "✔ Style installé dans ~/.claude/output-styles/couleurs.md"

# Active le style par défaut (Node.js est déjà installé avec Claude Code)
node -e '
const fs = require("fs"), p = process.env.HOME + "/.claude/settings.json";
let s = {};
if (fs.existsSync(p)) { try { s = JSON.parse(fs.readFileSync(p, "utf8")); } catch (e) { console.error("✖ ~/.claude/settings.json est illisible, activation manuelle nécessaire : /output-style Couleurs"); process.exit(0); } }
s.outputStyle = "Couleurs";
fs.writeFileSync(p, JSON.stringify(s, null, 2) + "\n");
console.log("✔ Style activé pour toutes les sessions (~/.claude/settings.json)");
'
echo "→ Relancez Claude Code pour voir le changement."
