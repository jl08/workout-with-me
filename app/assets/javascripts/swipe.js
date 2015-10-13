$(document).ready(function(){
   $("#potential_match_avatar").swipe( {
    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
      if (direction == "left"){
        $("#dislike_form").submit();
      } else if (direction == "right"){
        $("#like_form").submit();
      }
    },threshold:75
  });
})
