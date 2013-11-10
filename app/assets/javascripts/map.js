var map;
var bounds;

$(document).ready(function() {
  myMap();
});

function myMap() {
  var mapOptions = {
    center: new google.maps.LatLng(51.51121389999999, -0.1198244),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-area"),
    mapOptions);

  bounds = new google.maps.LatLngBounds();
  plotMarkers();
};

function plotMarkers() {
  $.ajax({
    url: '/to_dos.json',
    success: function(json) {
      _(json).each(function(t) {
        plotMarker(t.latitude, t.longitude, t.name);
      });
    }
  });
};

function plotMarker(lat, lng, name) {
  var latlng = new google.maps.LatLng(lat, lng);
  new google.maps.Marker({
    position: latlng,
    map: map,
    title: name
  });
  bounds.extend(latlng);
  map.fitBounds(bounds);
};