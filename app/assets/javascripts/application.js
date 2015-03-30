// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
  if($('#totalVisitors').length != 0){
    circles('visitorCountBg');

    var totalVisitors = document.getElementById("totalVisitors");
    var countTotal = totalVisitors.getAttribute('data-count-total');
    var totalVisitorsCountUp = new countUp("totalVisitors", 0, countTotal, 0, 3);
    totalVisitorsCountUp.start();

    var uniqueVisitors = document.getElementById("uniqueVisitors");
    var countUnique = uniqueVisitors.getAttribute('data-count-unique');
    var uniqueVisiorsCountUP = new countUp("uniqueVisitors", 0, countUnique, 0, 3);
    uniqueVisiorsCountUP.start();
  }

  if($('.download-count').length != 0){
    $.get('/gem_count.json', function(data){
      $('.gem-counter-spinner').hide();
      $('.download-count').text('Total: '+ data.total_downloads);
    });
  }
});