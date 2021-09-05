// ##########イベント予約時の料金自動計算処理 ##########

$(document).on('turbolinks:load', function() {
  $('#entry_count').change(function() {
  
    var price = $('#event_price').val();
    var count = $('#entry_count').val();
  
    var price_i = parseInt(price);
    var count_i = parseInt(count);
  
    var result = price_i * count_i
  
    $('#entry_price').val(result)
  });
});


// ########## Google.mapの表示 ##########
var gMap = null;
var gMarkerCenter = null;

function initMap() {
    // 登録されている住所の緯度/経度を利用して位置を特定
    var e = document.getElementById('map');
    var lat = e.getAttribute('data-lat-id');
    var lng = e.getAttribute('data-lng-id');
    var myLatLng = new google.maps.LatLng(lat, lng)
    var mapOptions = {
        center: myLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    // Google.map表示
    gMap = new google.maps.Map(document.getElementById("map"), mapOptions);
    gMarkerCenter = drawMarkerCenterInit(myLatLng);
}


// ########## Google.map Markerを生成 ##########
function drawMarkerCenterInit(pos) {
    var markerCenter = new google.maps.Marker({
        position: pos,
        map: gMap,
        draggable: true
    });
    return markerCenter;
}
