# Couleurs — repères visuels pour Claude Code

Un style de réponse (*output style*) pour Claude Code dans le terminal. Claude découpe chaque réponse en blocs précédés d'une pastille de couleur. Vous voyez ainsi tout de suite où regarder :

| Repère | Contenu |
|---|---|
| 🔵 **Explication** | Ce que Claude fait et pourquoi |
| 🔴 **Erreur** | Les erreurs rencontrées, avec le message exact |
| 🟡 **Avertissement** | Les risques et les points à valider |
| 🟢 **Conclusion** | Toujours à la fin : le résultat et la prochaine étape |

> Limite : Claude Code ne permet pas de changer la couleur du texte lui-même. Les couleurs viennent des pastilles emoji en tête de chaque bloc.

---

## Installation

Prérequis : Claude Code installé et fonctionnel dans le terminal (`claude --version`).

### Installation en une commande (la plus simple)

Copiez cette ligne dans le terminal (pas dans Claude Code) :
```bash
mkdir -p ~/.claude/output-styles && curl -fsSL https://raw.githubusercontent.com/<utilisateur-ou-org>/<nom-du-depot>/main/output-styles/couleurs.md -o ~/.claude/output-styles/couleurs.md
```
Relancez ensuite Claude Code et tapez `/output-style Couleurs`. Pour mettre à jour le style, relancez la même commande.

### Méthode 1 : copie du fichier

1. Récupérez le projet.
   - Depuis le dépôt Git :
     ```bash
     git clone <URL_DU_DEPOT> couleurs-terminal
     ```
   - Ou depuis le zip reçu :
     ```bash
     unzip couleurs-terminal.zip
     ```
2. Copiez le style dans votre dossier Claude Code :
   ```bash
   mkdir -p ~/.claude/output-styles
   cp couleurs-terminal/output-styles/couleurs.md ~/.claude/output-styles/
   ```
3. Relancez Claude Code (`claude`).

> Pour activer le style uniquement dans un projet, copiez le fichier dans `.claude/output-styles/` à la racine de ce projet plutôt que dans `~/.claude/`. Une fois le fichier commité, tous ceux qui travaillent sur le projet l'ont automatiquement.

### Méthode 2 : via le marketplace de plugins

Dans Claude Code :
```
/plugin marketplace add <utilisateur-ou-org>/<nom-du-depot>
/plugin install couleurs-terminal@couleurs-terminal
```
Relancez ensuite Claude Code. Si **Couleurs** n'apparaît pas dans `/output-style`, utilisez la méthode 1.

---

## Utilisation

1. Dans Claude Code, activez le style :
   ```
   /output-style Couleurs
   ```
2. Vérifiez avec `/output-style` : la liste doit afficher `Couleurs (current)`.
3. Le choix est conservé d'une session à l'autre. Si le style ne s'applique pas tout de suite, tapez `/clear`.

Pour revenir à l'affichage normal :
```
/output-style default
```

### Tester

| Demande à Claude | Blocs attendus |
|---|---|
| `Explique-moi en quelques lignes ce que contient ce dossier.` | 🔵 🟢 |
| `Lance "cat fichier-qui-nexiste-pas.txt" et dis-moi ce qui se passe.` | 🔴 🟢 |
| `Je veux supprimer tous les .log de ce dossier. Que dois-je savoir avant ? Ne supprime rien.` | 🟡 🟢 |

---

## Personnaliser

Tout se règle dans `output-styles/couleurs.md`. Pour ajouter une catégorie, par exemple 🟣 **Commande à lancer**, ajoutez une ligne à la liste des repères. Relancez ensuite Claude Code.

## Désinstaller

```bash
rm ~/.claude/output-styles/couleurs.md
```
Si vous l'avez installé comme plugin : `/plugin uninstall couleurs-terminal`.

---

## Publier une nouvelle version (mainteneurs)

1. Modifiez `output-styles/couleurs.md`.
2. Augmentez `version` dans `.claude-plugin/plugin.json`.
3. Commitez et poussez sur le dépôt. Les utilisateurs de la méthode 1 recopient le fichier. Ceux de la méthode 2 lancent `/plugin marketplace update couleurs-terminal`.

### Structure du projet
```
couleurs-terminal/
├── .claude-plugin/
│   ├── plugin.json        # métadonnées du plugin
│   └── marketplace.json   # permet l'installation via /plugin
├── output-styles/
│   └── couleurs.md        # le style lui-même
└── README.md
```
