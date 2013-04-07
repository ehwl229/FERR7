var $input    = $('#input-field');
var $list     = $('#list-target');
var $document = $(document);
var $window   = $(window);

var page = 0;

// $document.on('scroll', function() {
//     if ($window.scrollTop() + $window.height() > $document.height() - $window.height()) {
//         //console.log("CLOSE TO THE BOTTOM");
//     } else {
//         //console.log("NOT CLOSE TO THE BOTOTM");
//     }
// });

function drawResults(results) {

    for(var i = 0; i < results.length; i++) {

        photo  = results[i];
        imgSrc = "http://farm"+photo.farm+".static.flickr.com/"+photo.server+"/"+photo.id+"_"+photo.secret+"_m.jpg";

        $item = $('<li></li>');

        $img  = $('<img>');
        $img.attr('src', imgSrc);
        $img.css('width', '400px');

        $item.append($img);
        $list.prepend($item);
    }

}

function searchFlickr(query, page, cb) {
    $.ajax({
        url: 'http://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&jsoncallback=?',
        data: {
            text: query,
            api_key: 'cb8af8caa407b482fc42f891f05e0951',
            per_page: 10,
            page: page,
        },
        dataType: 'jsonp'
    }).done(function(r){
        cb(r.photos.photo);
    })
}


$input.on('keyup', function(e){
    //13 is enter
    if (e.keyCode == 13) {  
        searchFlickr($input.val(), page, drawResults);
        return false;
    }
});
