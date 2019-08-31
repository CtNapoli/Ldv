document.addEventListener 'turbolinks:load', () ->

    #FUNCTIONS ------------------------------------------------------------------------------------------------------
    markersArray = []
    window.initMap = (apartments, zoom = 10) ->
        if apartments.length == 1
            centerPoint = {lat: parseFloat(apartments[0].lat), lng: parseFloat(apartments[0].lng)}
        else
            centerPoint = {lat: 40.628119, lng: 14.375022}

        map = new google.maps.Map(
            document.querySelector('#map'), 
            {
                zoom: zoom, 
                center: centerPoint,
                styles: [
                    {
                        "featureType": "administrative",
                        "elementType": "labels.text.fill",
                        "stylers": [
                            {
                                "color": "#444444"
                            }
                        ]
                    },
                    {
                        "featureType": "landscape",
                        "elementType": "all",
                        "stylers": [
                            {
                                "color": "#f2f2f2"
                            }
                        ]
                    },
                    {
                        "featureType": "poi",
                        "elementType": "all",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "road",
                        "elementType": "all",
                        "stylers": [
                            {
                                "saturation": -100
                            },
                            {
                                "lightness": 45
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "all",
                        "stylers": [
                            {
                                "visibility": "simplified"
                            }
                        ]
                    },
                    {
                        "featureType": "road.arterial",
                        "elementType": "labels.icon",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "transit",
                        "elementType": "all",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "water",
                        "elementType": "all",
                        "stylers": [
                            {
                                "color": "#0e2f65"
                            },
                            {
                                "visibility": "on"
                            }
                        ]
                    }
                ]
            })

        return map


    window.setMarkers = (map, markers) ->
        i = 0
        img = '"' + markers[i].image + '"'
        while (i < markers.length)
            contentString = "<div class='window-marker-container'>
                                    <div class='window-marker-image'>
                                        <div class='image' style='background-image: url(" + img + ")'></div>
                                    </div>
                                    <div class='window-marker-info'> 
                                        <a href='" + markers[i].link + "'>
                                            <span class='title'>" + markers[i].name + "</span>
                                        </a>
                                        <div class='info'>
                                            <div class='features'>
                                                <div class='feature'><span class='normal-text'>" + markers[i].capacity + "</span></div>
                                                <div class='dot-separator'></div>
                                                <div class='feature'><span class='normal-text'>" + markers[i].rooms + "</span></div>
                                                <div class='dot-separator'></div>
                                                <div class='feature'><span class='normal-text'>" + markers[i].bedrooms + "</span></div>
                                                <div class='dot-separator'></div>
                                                <div class='feature'><span class='normal-text'>" + markers[i].toilette + "</span></div>
                                            </div>
                                            <div class='apartment' style='margin-top: 20px;'>
                                                <div class='price'>
                                                    <p class='secondary-font font-italic'>" + markers[i].minimumpricestring + "</p>
                                                    <p class='digit secondary-font font-italic'>" + markers[i].defaultprice + "</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>"

            storeInfowindow = new google.maps.InfoWindow({
                content: contentString,
            })

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(markers[i].lat, markers[i].lng),
                map: map,
                icon: '/pin-map.png',
                title: markers[i].name,
                infowindow: storeInfowindow
            })

            google.maps.event.addListener(marker, 'click', () ->
                this.infowindow.open(map, this)
            )

            markersArray.push(marker)

            i++

    window.deleteMarkers = () ->
        i = 0
        while i < markersArray.length
            markersArray[i].setMap(null)
            i++

        markersArray = []

    window.markerPreload = () ->
        apartments = $('#apartments-map #preload .apartment').map(()->
            return {
                lat: $(this).data('lat'), 
                lng: $(this).data('lng'), 
                name: $(this).data('name'), 
                image: $(this).data('image'),
                capacity: $(this).data('capacity'),
                rooms: $(this).data('rooms'),
                bedrooms: $(this).data('bedrooms'),
                toilette: $(this).data('toilette')
                minimumpricestring: $(this).data('minimumpricestring')
                minimumprice: $(this).data('minimumprice')
                defaultprice: $(this).data('defaultprice')
                link: $(this).data('link')
            }
        ).get()

        return apartments

    if $('#map').length
        apartments = markerPreload()
        window.map = initMap(apartments)
        setMarkers(map, apartments)
