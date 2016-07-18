$(document).ready(function(){
 $('#signup-form').on('submit', function(e){
    e.preventDefault();
    $.auth.emailSignUp({
      email: $('#signup-form input[name="email"]').val(),
      password: $('#signup-form input[name="password"]').val(),
      password_confirmation: $('#signup-form input[name="password_confirmation"]').val()
    }).then(function(resp){
      console.log(resp)
      window.location.href = "/login";

    }).fail(function(resp){
      console.log(resp)
    });
  });
});