var latitude = 48.867721,
	longitude = 2.34963,
	map_zoom = 3;

//google map custom marker icon - .png fallback for IE11
var is_internetExplorer11= navigator.userAgent.toLowerCase().indexOf('trident') > -1;
var marker_url = ( is_internetExplorer11 ) ? 'images/cd-icon-location.png' : 'images/cd-icon-location.svg';
	
//define the basic color of your map, plus a value for saturation and brightness
var	main_color = '#2d313f',
	saturation_value= -20,
	brightness_value= 5;

//we define here the style of the map
var style= [{
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [{
        "color": "#f9ced9"
    }]
}, {
    "featureType": "landscape",
    "elementType": "geometry",
    "stylers": [{
        "color": "#ffffff"
    }]
}, {
    "featureType": "poi",
    "stylers": [{
        "color": "#2ecc71"
    }, {
        "lightness": -7
    }]
}, {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{
        "color": "#2ecc71"
    }, {
        "lightness": -28
    }]
}, {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [{
        "color": "#2ecc71"
    }, {
        "visibility": "on"
    }, {
        "lightness": -15
    }]
}, {
    "featureType": "road.local",
    "elementType": "geometry",
    "stylers": [{
        "color": "#2ecc71"
    }, {
        "lightness": -18
    }]
}, {
    "elementType": "labels.text.fill",
    "stylers": [{
        "color": "#ffffff"
    }, {
        "visibility": "off"
    }]
}, {
    "elementType": "labels.text.stroke",
    "stylers": [{
        "visibility": "off"
    }]
}, {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [{
        "color": "#2ecc71"
    }, {
        "lightness": -34
    }]
}, {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [{
        "visibility": "on"
    }, {
        "color": "#f9ced9"
    }, {
        "weight": 0.8
    }]
}, {
    "featureType": "poi.park",
    "stylers": [{
        "color": "#2ecc71"
    }]
}, {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [{
        "color": "#333739"
    }, {
        "weight": 0.3
    }, {
        "lightness": 10
    }]
}];

//set google map options
var map_options = {
  	center: new google.maps.LatLng(latitude, longitude),
  	zoom: map_zoom,
  	panControl: false,
  	zoomControl: false,
  	mapTypeControl: false,
  	streetViewControl: false,
  	mapTypeId: google.maps.MapTypeId.ROADMAP,
  	scrollwheel: false,
  	styles: style,
}
//inizialize the map
var map = new google.maps.Map(document.getElementById('google-container'), map_options);

