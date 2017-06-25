
$(document).ready(function(){
    var mymap = L.map('map').setView([29.9090876153,121.6371381786], 13);

    L.tileLayer('http://{s}.google.cn/vt/lyrs=m&x={x}&y={y}&z={z}', {
        attribution: 'MapNotes',
        maxZoom: 18,
        subdomains:['mt0','mt1','mt2','mt3']
    }).addTo(mymap);

    mymap.on('click', onMapClick);
    function onMapClick(e) {
        $('.leaflet-shadow-pane').html("");
        $('.leaflet-overlay-pane').html("");
        $('.leaflet-marker-pane').html("");
        $('.leaflet-popup-pane').html("");
        $("input[id='note_latitude']").attr("value",e.latlng.lat);
        $("input[id='note_longitude']").attr("value",e.latlng.lng);
        var marker = new L.Marker(e.latlng);
        mymap.addLayer(marker);
        var form = $("#note-form-wrapper").html();
        marker.bindPopup(form).openPopup();
    }
});


