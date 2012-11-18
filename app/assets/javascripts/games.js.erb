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
 $('.info h6.title span').replaceWith("<span>" + info.name + "</span>");
 $('.info li.released span').replaceWith("<span>" + info.release_date + "</span>");
 $('.info li.steam_link a').replaceWith('<a href="' + info.url + '">Steam Link</a>');
}
function createPriceHistory(info) {
  info = JSON.parse(info);
  $("div.priceHistory ul").empty();
  for(i=0;i<info.length;i++){
    $("div.priceHistory ul").append("<li>"+info[i].ammount/100.00+ " on "+ (new Date(info[i].created_at)) + "</li>");
  }

}
function createExtras(info) {
  $("div.extras ul").empty();
  console.log(info);
  for(i=0;i<info.length;i++){
    current_price = info[i].current_price / 100.00
    if (current_price == 0){
      current_price = "free"
    }
    $("div.extras ul").append("<li>" +
      "<a href=\"games/" +
      info[i].game_id +
      "/extras/" +
      info[i].id +
      "\">" +
      info[i].name +
      " current price " +
      current_price +
      "</a>" +
      "</li>");
  }

}

function rowClick(){
 //expand and populated oth parts with cool shit
 $(".selected").removeClass("selected")
 $(this).addClass('selected');
 $.getJSON($(this).find('td a').attr('href') + ".json",function(data){
  createInfo(data[0]);
  createPriceHistory(data[1]);
  createExtras(data[2]);
  // $('.priceHistory').append('<p>' + data[1] + '</p>');
  // $('.extras').append('<p>' + data[2] + '</p>');
 });
}