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
function createInfo(info) {
  info = JSON.parse(info)
  console.log(info)
 $('.info h3.title span').replaceWith("<span>" + info.name + "</span>");
 $('.info li.released span').replaceWith("<span>" + info.release_date + "</span>");
 $('.info li.steam_link a').replaceWith('<a href="' + info.url + '">Steam Link</a>');
  // $('.info').replaceWith('<h1 class='title'>' + info.name + '</h1>');

}
function createPriceHistory () {


}
function createExtras () {


}
function rowClick(){
 //expand and populated oth parts with cool shit

 $(".selected").removeClass("selected")
 $(this).addClass('selected');
 $.getJSON($(this).find('td a').attr('href') + ".json",function(data){
  createInfo(data[0]);
  // $('.priceHistory').append('<p>' + data[1] + '</p>');
  // $('.extras').append('<p>' + data[2] + '</p>');
 });
}