// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var getFilename = function() {

  $('input[type="file"]').change(function(e){
    var fileName = e.target.files[0].name;
    $('.file-name').text(fileName);
    $('.file-name').addClass('padding-top-mini');
  });

};

$(document).ready(getFilename);
$(document).on('turbolinks:load', getFilename);


var getFilename = function() {

  if ($('#is-paid-click').prop('checked')) {
    $('#free-tab').addClass("unchecked-tab");
    $('#free-tab').removeClass("checked-tab");
    $('#paid-tab').addClass("checked-tab");
    $('#paid-tab').removeClass("unchecked-tab");
  };

  $('#free-tab').click(function() {
    $('#free-tab').removeClass("unchecked-tab");
    $('#free-tab').addClass("checked-tab");
    $('#paid-tab').removeClass("checked-tab");
    $('#paid-tab').addClass("unchecked-tab");
    $('.price-check').fadeOut();
  });

  $('#paid-tab').click(function() {
    $('#free-tab').addClass("unchecked-tab");
    $('#free-tab').removeClass("checked-tab");
    $('#paid-tab').addClass("checked-tab");
    $('#paid-tab').removeClass("unchecked-tab");
    $('.price-check').fadeIn();
  });

};

$(document).ready(getFilename);
$(document).on('turbolinks:load', getFilename);


var flashTimeout = function() {

  setTimeout(function() {
    $('.flash_js').fadeOut();
  }, 5000);

};

$(document).ready(flashTimeout);
$(document).on('turbolinks:load', flashTimeout);