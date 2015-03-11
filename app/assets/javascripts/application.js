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
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-switch
//= require jquery_ujs
//= require turbolinks
//= require selectize
//= require_tree .

$(document).ready(function(){$('select').selectize();});
$(document).ready(function (){$('[data-toggle="tooltip"]').tooltip();});
$(document).ready(function(){$("#switch").bootstrapSwitch();});
$.fn.bootstrapSwitch.defaults.size = 'small';
$.fn.bootstrapSwitch.defaults.onText = '<i class="fa fa-envelope-o"></i>';
$.fn.bootstrapSwitch.defaults.offText = 'Off';
