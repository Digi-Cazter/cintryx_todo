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
//= require jquery-ui
//= require bootstrap-sprockets
//= require best_in_place
//= require todos

$(document).ready(function(){
  $(".best_in_place").best_in_place();
  $( "#lists.sortable" ).sortable({
    placeholder: "ui-state-highlight",
    handle: ".drag-handle",
    forcePlaceholderSize: true,
    update: function( event, ui ) {
      $.ajax({
        url: "/lists/"+ui.item.attr("data-id"),
        method: "PUT",
        data: {list: {position: ui.item.index()+1}}
      });
    }
  });
  $( "#todos.sortable" ).sortable({
    placeholder: "ui-state-highlight",
    handle: ".drag-handle",
    forcePlaceholderSize: true,
    update: function( event, ui ) {
      $.ajax({
        url: "/lists/"+ui.item.attr("data-list-id")+"/todos/"+ui.item.attr("data-id"),
        method: "PUT",
        data: {todo: {position: ui.item.index()+1}}
      });
    }
  });
  $( ".sortable" ).disableSelection();
  countTodos()
});
