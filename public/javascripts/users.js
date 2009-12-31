var login_verify = function(color) {
  $("#user_login").prev().css("margin-top","10px");
  $("#user_login")
    .css("margin-top","10px")
    .parent()
    .css("border", color + " 1px solid");
  $("a[href=#verify]").css("color", color);
}

$(function(){
  $("a[href=#verify]").click(function(){
      var login = $("#user_login").val();
      if (login == "") {

      } else {
          $.ajax({
              method:'GET',
              url: '/users/' + login + ".json",
              error: function (XMLHttpRequest, textStatus, errorThrown) {
                login_verify("green");
              },
              success: function(){
                login_verify("red");
              }
          });
      }
  });

});

