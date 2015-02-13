// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on("click",".concept", function(e) {
   window.location.replace("/concepts/" + this.id);
});

$(document).on("click",".header-burger", function(e) {
   $(this).hide();
   $(".side-nav").show();
});

$(document).on("click", ".close", function(e) {
    $(".side-nav").hide();
});

$(document).on("keyup", ".search-bar", function(e) {
   var needle = $(this).val().toLowerCase();
   
    $(".concept").each(function() {
       var haystack = $(this).text().toLowerCase();
       if (haystack.indexOf(needle) >= 0)
         $(this).show();
      else
         $(this).hide();
    });
    
});