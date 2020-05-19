====================
TP noté (DUT MMI S2)
====================

Le site fourni affiche une liste de villes sur une carte, avec des marqueurs
clicables renvoyant vers une courte description de la ville et une photo

Pour ce TP, vous devez tous contribuer une ville (de votre choix) au site
de votre groupe TP, en utilisant git et GitHub comme vu lors des TP précédents
(En particulier comme au TP 3)

Avant la fin de la séance, de préférence dans un dépôt propre, il vous faudra
exécuter le script report.sh avec la commande `./report.sh` exécutée dans le
répertoire du projet, répondre aux questions posées par le script et déposer
le fichier diagnostique.txt ainsi créé sur le devoir moodle. Si le script ne
s'exécute pas sur votre machine (pas de questions ou pas de fichier diagnostique),
contactez-moi.

--------
Information sur le groupe :
--------

Plusieurs choses à modifier :

```Html
      var villes = { // seules les villes ajoutées dans ce tableau sont affichées sur la carte
        "Courrières": { "lat": 50.45, "lon": 2.9333 },
        "Brest": { "lat": 48.383, "lon": -4.500 }
      };
      ```
La ville entre guillemet est le nom de l'**id** présent dans partie comme ci :
```
<div class="column col-xs-12 col-sm-6 col-md-3 col-2 col-lg-1">
        <div id="ville_Courrières" class="card bg-dark m-2">
        </div>
      </div>

```
Ici le nom à mettre est "Courrières" :)
