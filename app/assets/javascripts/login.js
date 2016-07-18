$(document).ready(function(){
 $('#login-form').on('submit', function(e){
    e.preventDefault();
    $.auth.emailSignIn({
      email: $('#login-form input[name="email"]').val(),
      password: $('#login-form input[name="password"]').val(),
      password_confirmation: $('#login-form input[name="password_confirmation"]').val()
    }).then(function(resp){
      console.log(resp)
      window.location.href = "/posts";
    }).fail(function(resp){
      console.log(resp)
    });
  });
});