﻿function theRotator() {
    //Set the opacity of all images to 0
    $('div.rotator ul li').css({ opacity: 0.0 });

    //Get the first image and display it (gets set to full opacity)
    $('div.rotator ul li:first').css({ opacity: 1.0 });

    //Call the rotator function to run the slideshow, 6000 = change to next image after 6 seconds

    if ($('div.rotator ul li').length > 1) {
        setTimeout('rotate()', 6000);
    }
}

function rotate() {
    //Get the first image
    var current = ($('div.rotator ul li.show') ? $('div.rotator ul li.show') : $('div.rotator ul li:first'));

    if (current.length == 0) current = $('div.rotator ul li:first');

    //Get next image, when it reaches the end, rotate it back to the first image
    var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div.rotator ul li:first') : current.next()) : $('div.rotator ul li:first'));


    //Set the fade in effect for the next image, the show class has higher z-index
    next.css({ opacity: 0.0 }).addClass('show').animate({ opacity: 1.0 }, 1000);

    //Hide the current image
    current.animate({ opacity: 0.0 }, 1000, function () { setTimeout('rotate()', 6000); }).removeClass('show');

};

$(document).ready(function () {
    //Load the slideshow
    theRotator();
    $('div.rotator').fadeIn(1000);
    $('div.rotator ul li').fadeIn(1000); // tweek for IE
});
