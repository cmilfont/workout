function remove_syn(id, link) {
  $.ajax({
    url: "/synonymous_of_exercises/" + id + ".json",
    data: "id=" + id,
    type: "DELETE",
    error: function(xhr, textStatus, errorThrown) {
      alert("Problema no servidor >> " + textStatus);
    },
    success: function(data, textStatus) {
      $(link).parent().remove();
    }
  });
};

function add_synonym() {

  var synonymous_of_exercises = {
    "synonymous_of_exercise[exercise_id]": $("#exercise_id").val(),
    "synonymous_of_exercise[synonym]": $("#add_syn").val(),
    "synonymous_of_exercise[user_id]": $("#user_id").val()
  };

  $.ajax({
    url: "/synonymous_of_exercises.json",
    data: synonymous_of_exercises,
    dataType: "json",
    type: "POST",
    error: function(xhr, textStatus, errorThrown) {
      alert("Problema no servidor >> " + textStatus);
    },
    success: function(data, textStatus) {
      var link = "<a onclick='remove_syn(" + data.synonymous_of_exercise.id + ", this)' href='#'>Excluir Sinônimo</a>";
      var html = data.synonymous_of_exercise.synonym + " " + link;
      $("<p>").html(html).appendTo($("#synonymous"));
    }
  });
  $(this).parent().children("input").remove()
}

$(function(){

  $("a[href='#add_synonymous']").click(function(){
    $("<input>")
      .attr("id","add_syn")
      .attr("size","16").insertBefore($(this))
    $("<input>")
      .attr("value","Enviar")
      .attr("type", "button")
      .click(add_synonym)
      .insertBefore($(this))
  });

});

