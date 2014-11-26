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
//= require jquery.maskedinput
//= require bootstrap-datepicker
//= require bootstrap-select
//= require highcharts
//= require_tree .



$(document).ready(function() {
	$(".campo_telefone").mask("(99) 9999-9999");
});

$(document).ready(function() {
	$(".campo_cep").mask("99.999-999");
});

$(document).ready(function() {
	$('.campo_fax').mask("999 9999-9999")
});	

$(document).ready(function() {
	$('.datepicker').datepicker()
});	

$(document).ready(function() {
	$(".campo_cpf").mask("999.999.999-99");
});

$(document).ready(function() {
	$(".campo_identidade").mask("99.999.999-9");
});






