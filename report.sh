#!/bin/bash
#### Config
depot="carte.git"
resultat="diagnostique.txt"
read -p "Votre login sur GitHub :" login
read -p "Etiez-vous intégrateur ? (O/N) " inte
### Analyse
remote="$(git remote -v)"
echo "`whoami` https://github.com/$login/$depot">$resultat
if [[ "$remote" =~ origin.*https://github.com/(.*)/$depot ]]; then
  origin="${BASH_REMATCH[1]}"
fi
if [[ "$remote" =~ upstream.*https://github.com/(.*)/$depot ]]; then
  upstream="${BASH_REMATCH[1]}"
fi
echo "$origin/$upstream ($inte)">>$resultat
### Logs
git status >>$resultat
git branch -a >>$resultat
echo "$remote">>$resultat
git log --oneline>>$resultat
git reflog>>$resultat
### Fin
echo "Veuillez maintenant déposer le fichier $resultat sur moodle. Vous pouvez ensuite le supprimer"
