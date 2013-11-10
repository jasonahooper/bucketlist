var map;

$(document).ready(function() {
  myMap();
});

function myMap() {
  console.log("here");
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-area"),
    mapOptions);
};
