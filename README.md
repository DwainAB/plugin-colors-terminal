# Couleurs — repères visuels pour Claude Code

Un style de réponse (*output style*) pour Claude Code dans le terminal. Claude découpe ses réponses en blocs précédés d'une pastille de couleur. Vous voyez ainsi tout de suite où regarder :

| Repère | Contenu |
|---|---|
| 🔵 **Explication** | Ce que Claude fait et pourquoi |
| 🔴 **Erreur** | Les erreurs rencontrées, avec le message exact |
| 🟡 **Avertissement** | Les risques et les points à valider |
| 🟢 **Conclusion** | Toujours à la fin : le résultat et la prochaine étape |

Claude n'utilise que les blocs utiles. Le style change la mise en forme, pas le contenu : pas d'explication ajoutée pour remplir un bloc.

> Claude Code ne permet pas de changer la couleur du texte lui-même. Les couleurs viennent des pastilles en tête de chaque bloc.

---

## Installation (une commande)

Prérequis : Claude Code installé (`claude --version`).

Dans le terminal (pas dans Claude Code) :
```bash
curl -fsSL https://raw.githubusercontent.com/DwainAB/plugin-colors-terminal/main/install.sh | bash
```

Cette commande :
1. installe le style dans `~/.claude/output-styles/couleurs.md` ;
2. l'active pour toutes vos sessions Claude Code, dans `~/.claude/settings.json`, sans toucher à vos autres réglages.

Relancez ensuite Claude Code (`claude`), puis tapez `/output-style`. La liste doit afficher **Couleurs (current)**.

---

## Utilisation

Le style est actif automatiquement, il n'y a rien à faire.

| Action | Commande dans Claude Code |
|---|---|
| Voir le style actif | `/output-style` |
| Revenir à l'affichage normal (projet en cours) | `/output-style default` |
| Réactiver le style | `/output-style Couleurs` |

Si le style ne s'applique pas tout de suite, tapez `/clear`.

### Tester

| Demande à Claude | Blocs attendus |
|---|---|
| `Explique-moi en quelques lignes ce que contient ce dossier.` | 🔵 🟢 |
| `Lance "cat fichier-qui-nexiste-pas.txt" et dis-moi ce qui se passe.` | 🔴 🟢 |
| `Je veux supprimer tous les .log de ce dossier. Que dois-je savoir avant ? Ne supprime rien.` | 🟡 🟢 |

---

## Mettre à jour

Relancez la commande d'installation :
```bash
curl -fsSL https://raw.githubusercontent.com/DwainAB/plugin-colors-terminal/main/install.sh | bash
```

## Désinstaller

```bash
rm ~/.claude/output-styles/couleurs.md
```
Retirez ensuite la ligne `"outputStyle": "Couleurs"` de `~/.claude/settings.json`.

---

## Pour un seul projet (toute l'équipe, sans installation)

À la racine du dépôt du projet :
1. Copiez `output-styles/couleurs.md` dans `.claude/output-styles/couleurs.md`.
2. Ajoutez `"outputStyle": "Couleurs"` dans `.claude/settings.json`.
3. Commitez les deux fichiers. Tous ceux qui ouvrent le projet avec Claude Code auront le style.

---

## Personnaliser

Tout se règle dans `output-styles/couleurs.md`. Pour ajouter une catégorie, par exemple 🟣 **Commande à lancer**, ajoutez une ligne à la liste des repères.

## Structure du projet
```
plugin-colors-terminal/
├── .claude-plugin/
│   ├── plugin.json        # métadonnées du plugin
│   └── marketplace.json   # installation via /plugin
├── output-styles/
│   └── couleurs.md        # le style lui-même
├── install.sh             # installation + activation en une commande
└── README.md
```
