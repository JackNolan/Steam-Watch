// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

// jQuery ->
//   gameTable = $('#games').dataTable
//     bProcessing: true
//     bServerSide: true
//     sScrollY: "600px"
//     sAjaxSource: $('#games').data('source')
//     "sDom": "fpr"
//   gameTable.$('tr').click ->
//     alert "test"

$(function(){
  gameTable = $('#games').dataTable({
    bProcessing: true,
    bServerSide: true,
    sScrollY: "600px",
    sAjaxSource: $('#games').data('source'),
    "sDom": "fp<'span6 preparing'r>"
  });
   $('#games tbody').delegate("tr", "click", rowClick);
})

function rowClick(){
 //expand and populated oth parts with cool shit
 alert();
}