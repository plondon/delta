$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  // bring up img or gif on link load
  $('#new_answer input').on("focusout", function(){
    link = $(this).val();

    $('html').append("<img src=" + link + ">")
  });
});
