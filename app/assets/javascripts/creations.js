/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
*/
$(document).ready(function() {

/* remove this line for production */
// console.log(cPieces[9].url);

var snd = new Audio("/dancer.mp3"); // buffers automatically when created
var current_img = [];
var current_format = [];
var id_string = "";

/* Show the next image in the queue */
function show_next_image() {
  /* replace the current feature item */
  
  if (current_img.length === 0) {
    return;
  }

  //$("#inner_feature").replaceWith(current_img.shift());
  var id = current_img.shift();
  var new_piece = $(".feature_" + id);
  if (cPieces[id-1].format == "video") { new_piece.get(0).play(); }

  if (!new_piece.hasClass("active_feat") )
  {
    $(new_piece).removeClass("hidden");
    $(new_piece).addClass("top_feat");
    $(".active_feat").addClass("hidden");
    $(".active_feat").removeClass("top_feat"); 
    $(".active_feat").removeClass("active_feat"); 
    $(new_piece).addClass("active_feat");
  	$("video").prop("muted", true);
  }
  else { return; }
  /* Progress the filmstrip */
  $("#filmstrip").find(':first').remove();
};

/* Experimenting with mouse motion

b_width = $('body').width()
b_height = $('body').height()

    $(document).mousemove(function(e){
      var bright = 7 + (e.pageY * 0.05);
      var r = Math.floor(150 * e.pageY/b_height);
      var g = Math.floor(254* e.pageX/b_width);
      var b = Math.floor(154 * e.pageY/e.pageX);
      $('#mouseinfo').html(e.pageX +', '+ e.pageY + ' | ' + r + ', ' + g + ', ' + b);
      $('html').css("background", "rgb("+r+","+g+","+b+")");
   }); 
*/


/* Handle user selections */
$("#grid .thumb").click(function(){
  var pieceid =  $(this).data('pieceid');
  do_piece(this.src, pieceid, cPieces[pieceid-1].format);
});

/* handle actions for each piece */
function do_piece(thumb_url, pieceid, format)
{
  current_format.push(format);

  /* Add video autoplay attribute */
  if (format == "video")
  {
    format = format + " autoplay";
  }
  current_img.push(pieceid);
  id_string = id_string + pieceid + ",";
  $("#filmstrip").append("<img src='" + thumb_url + "' class='thumb' alt=" + pieceid + "/>");
};


/* When the user clicks the feature area, the worker and song begin */
$('#feature').click(function(){
    if (snd.paused) {
    snd.play();
		do_worker();
    }
    else {
        snd.pause();
    }
});

$("#filmstrip thumb").click(function() {
  /* delete from everything! */
});

/* When linked to a creation page, this populates the page with stored data */
if (slide_list.length > 0)
{
  current_img = slide_list;
  var i = 0;
  for (i; i<slide_list.length;  i++)
  {
    $("#filmstrip").append("<img src='/assets/" + cPieces[slide_list[i]-1].thumb_url + "' class='thumb' alt=" + cPieces[slide_list[i]].id + "/>");
  }
}

/* Populate form field and show other fields when user clicks button */
$("#save_creation").click(function(){
  $("form.new_creation").css('display', 'block');  
  $("#creation_slides").html(id_string);
});


/* This function moves along the progress slider */
var song_progress = 0;
var bar_progress = 0;
function progress_bar(progress, slider_class)
{
    progress += 4.7;
   $(slider_class).css("margin-left", (-progress).toString() + "px");
  if (progress > 600){
    progress = 0;
  }
  return progress;
};

/* Create worker and process responses */
function do_worker(){
	if(typeof(w)=="undefined")
	  {
		w = new Worker("/_creations_worker.js");
		w.onmessage=function(event){
      /* fast responses move the progress bar and update the time field */
		  if (event.data == "fast") {
			  bar_progress = progress_bar(bar_progress, ".bar .slider");
        $("#audio_time").html((snd.currentTime).toFixed(2) + " seconds");
		  }
      /* slow responses display the next content piece */
		  else
		  {
			  show_next_image();
		  }
		  };
	}
};

});