var macarte = null;
var markerClusters; // Servira à stocker les groupes de marqueurs
// Nous initialisons une liste de marqueurs

// Fonction d'initialisation de la carte
function initMap() {
  var markers = []; // Nous initialisons la liste des marqueurs
  // Créer l'objet "macarte" et l'insèrer dans l'élément HTML qui a l'ID "map"
  macarte = L.map('map').setView([lat, lon], 11);
  markerClusters = L.markerClusterGroup(); // Nous initialisons les groupes de marqueurs
  // Leaflet ne récupère pas les cartes (tiles) sur un serveur par défaut. Nous devons lui préciser où nous souhaitons les récupérer. Ici, openstreetmap.fr
  L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
    // Il est toujours bien de laisser le lien vers la source des données
    attribution: 'données © <a href="//osm.org/copyright">OpenStreetMap</a>/ODbL - rendu <a href="//openstreetmap.fr">OSM France</a>',
    minZoom: 1,
    maxZoom: 20
  }).addTo(macarte);
  // Nous parcourons la liste des villes
  for (ville in villes) {
    var marker = L.marker([villes[ville].lat, villes[ville].lon],{ville: ville}); // pas de addTo(macarte), l'affichage sera géré par la bibliothèque des clusters
    marker.on('click',onClick);
  //marker.bindPopup(ville);
    markerClusters.addLayer(marker); // Nous ajoutons le marqueur aux groupes
    markers.push(marker); // Nous ajoutons le marqueur à la liste des marqueurs
  }
  var group = new L.featureGroup(markers); // Nous créons le groupe des marqueurs pour adapter le zoom
    macarte.fitBounds(group.getBounds().pad(0.5)); // Nous demandons à ce que tous les marqueurs soient visibles, et ajoutons un padding (pad(0.5)) pour que les marqueurs ne soient pas coupés
  macarte.addLayer(markerClusters);
}

function onClick(){
    console.log(this.options);
    var url = location.href;               //Save down the URL without hash.
    location.href = "#ville_"+this.options.ville;                 //Go to the target element.
    history.replaceState(null,null,url);   //Don't like hashes. Changing it back.
}
