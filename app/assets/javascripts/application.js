// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

// returns an Array of elements marked done
//
// returns an Array of Elements  
function get_all_mark_done(){
  return document.getElementsByClassName("mark--done");
}
  
// returns an Array of elements marked undone
//
// returns an Array of Elements
function get_all_mark_undone(){
  return document.getElementsByClassName("mark--undone");
}
  
window.onload = function() {
  document.getElementsByClassName("mark")
} 