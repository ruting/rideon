var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var geocoder = new google.maps.Geocoder(); // Set GOOGLE GEOCODER OJBECT
var map;


function map_init() {

  directionsDisplay = new google.maps.DirectionsRenderer(); // Get GOOGLE MAP DIRECTION
  var Singapore = new google.maps.LatLng(1.3667,103.8); // Set Center Map location
  var mapOptions = {
    zoom:11,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: Singapore
  }
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions); // Set map image onto the canvas 
  directionsDisplay.setMap(map); // Pass in DIRECTION VARIABLE INTO MAP DISPLAY

}

// NEED TO FIND OUT HOW TO CALCULATE BASED ON MULTIPLE ROUTE
function calcRoute() {
  var start = document.getElementById("gmaps-input-address").value;
  var end = document.getElementById("end").value;
  var request = {
    origin:start,
    destination:end,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(result, status) { // Get directions
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
    }
  });
}


// Autocomplete places test

var defaultBounds = new google.maps.LatLngBounds(
  new google.maps.LatLng(-33.8902, 151.1759),
  new google.maps.LatLng(-33.8474, 151.2631));

var input = document.getElementById('end');
var options = {
  bounds: defaultBounds,
  types: ['establishment']
};

autocomplete = new google.maps.places.Autocomplete(input, options);



  // move the marker to a new position, and center the map on it
  function update_map( geometry ) {
    map.fitBounds( geometry.viewport )
    marker.setPosition( geometry.location )
  }
  

// fill in the UI elements with new position data
function update_ui( address, latLng ) {
  $('#gmaps-input-address').autocomplete("close");
  $('#gmaps-input-address').val(address);
  //$('#gmaps-output-latitude').html(latLng.lat());
  //$('#gmaps-output-longitude').html(latLng.lng());
}

// initialise the jqueryUI autocomplete element
function autocomplete_init() {
  $("#gmaps-input-address").autocomplete({

    // source is the list of input options shown in the autocomplete dropdown.
    // see documentation: http://jqueryui.com/demos/autocomplete/
    source: function(request,response) {

      // the geocode method takes an address or LatLng to search for
      // and a callback function which should process the results into
      // a format accepted by jqueryUI autocomplete
      geocoder.geocode( {'address': request.term }, function(results, status) {
        response($.map(results, function(item) {
          return {
            label: item.formatted_address, // appears in dropdown box
            value: item.formatted_address, // inserted into input element when selected
            geocode: item                  // all geocode data: used in select callback event
          }
        }));
      })
    },

    // event triggered when drop-down option selected
    select: function(event,ui){
      update_ui(  ui.item.value, ui.item.geocode.geometry.location )
      update_map( ui.item.geocode.geometry )
    }
  });

  // triggered when user presses a key in the address box
  $("#gmaps-input-address").bind('keydown', function(event) {
    if(event.keyCode == 3) {
      geocode_lookup( 'address', $('#gmaps-input-address').val(), true );

      // ensures dropdown disappears when enter is pressed
      $('#gmaps-input-address').autocomplete("disable")
    } else {
      // re-enable if previously disabled above
      $('#gmaps-input-address').autocomplete("enable")
    }
  });
}; // autocomplete_init




$(document).ready(function() { 
    map_init(); // Set google Map
    autocomplete_init(); // Set auto Complete fields
});