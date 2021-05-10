#!/bin/bash
#### Config
depot="carte"
resultat="diagnostique.txt"
read -p "Votre login sur GitHub :" login
read -p "Etiez-vous intégrateur ? (o/N) " inte
case "$inte" in
  y|Y|o|O ) inte="O"; etreinte="être intégrateur";;
  * ) inte="N"; etreinte="ne pas être intégrateur";;
esac
### Analyse
remote="$(git remote -v)"
github="https://github.com/$login/$depot"
echo "`whoami` $github">$resultat
if [[ "$remote" =~ origin[[:space:]]https://github.com/([^/]*)/$depot ]]; then
  origin="${BASH_REMATCH[1]}"
fi
if [[ "$remote" =~ upstream[[:space:]]https://github.com/([^/]*)/$depot ]]; then
  upstream="${BASH_REMATCH[1]}"
fi
echo "$origin/$upstream ($inte)">>$resultat
### Logs
git status >>$resultat
git branch -a >>$resultat
echo "$remote">>$resultat
git log --oneline>>$resultat
git reflog>>$resultat
date >> $resultat
### Verif
echo
echo "Vérifications"
echo "============="
echo
echo "1) Lien vers votre dépôt sur github : $github (cliquez sur le lien ou copiez/collez dans un navigateur pour vérifier)"
echo "2) Vous avez indiqué $etreinte"
echo "3) Un fichier $resultat résultat a normalement été créé dans le répertoire courant. Vérifiez qu'il existe et qu'il contient le lien vers votre dépôt github en première ligne"
echo
echo "Si une des vérifications ne donne pas le résultat attendu, relancez ce script"
echo
echo "Rendu"
echo "====="
echo
echo "Après les vérifications, déposez le fichier $resultat sur le devoir moodle (attention, c'est bien le fichier $resultat qu'il faut déposer, pas report.sh)"
echo
read -p "Appuyez sur Entrée pour quitter" entree
