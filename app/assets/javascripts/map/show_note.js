
$(document).ready(function(){
    var mymap = L.map('map').setView([29.9090876153,121.6371381786], 13);

    L.tileLayer('http://{s}.google.cn/vt/lyrs=m&x={x}&y={y}&z={z}', {
        attribution: 'MapNotes',
        maxZoom: 18,
        subdomains:['mt0','mt1','mt2','mt3']
    }).addTo(mymap);

    if (gon.note) {
        var marker = L.marker([gon.note.latitude, gon.note.longitude]).addTo(mymap);
        var content = $("#note_" + gon.note.id).html();
        marker.bindPopup(content).openPopup();
    }

});


