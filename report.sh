#!/bin/bash
#### Config
depot="carte"
resultat="diagnostique.txt"
if [ ! -f ./report.sh ]; then
  echo "Ce script foit être lancé dans le répertoire du projet"
  exit 1
fi
echo "Ce script va générer le fichier ($resultat), à déposer sur moodle."
echo "Merci de fournir les informations suivantes :"
echo
read -p "Nom et prénom :" nom
read -p "Groupe (ex A1) :" groupe
read -p "Votre login sur GitHub :" login
read -p "Etiez-vous intégrateur sur cette séance ? (o/N) " inte
case "$inte" in
  y|Y|o|O ) inte="O"; etreinte="intégrateur";;
  * ) inte="N"; etreinte="pas intégrateur";;
esac
### Analyse
remote="$(git remote -v)"
github="https://github.com/$login/$depot"
echo "$nom $groupe (`whoami`) $github">$resultat
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
echo "Vous êtes $nom ($groupe), $etreinte"
echo "Votre dépôt sur GitHub : $github"
echo
echo "1) Vérifiez les informations"
echo "2) Ouvrez le lien dans un navigateur pour vérifier qu'il est correct"
echo "3) Un fichier $resultat a normalement été créé dans le répertoire courant. Vérifiez qu'il existe et qu'il contient le lien vers votre dépôt github en première ligne"
echo
echo "Si une des vérifications ne donne pas le résultat attendu, relancez ce script"
echo
echo "Rendu"
echo "====="
echo
echo "Après les vérifications, déposez le fichier $resultat sur le devoir moodle (attention, c'est bien le fichier $resultat qu'il faut déposer, pas report.sh. Ne pas renommer le fichier)"
echo
read -p "Appuyez sur Entrée pour quitter" entree
