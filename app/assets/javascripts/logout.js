$(document).ready(function(){
  $('#logout-button').on('click', function(){
    $.auth.signOut();
    window.location.href = "/";
  });
});