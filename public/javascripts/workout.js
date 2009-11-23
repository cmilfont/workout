var isEven = function(someNumber){
  return (someNumber%2 == 0) ? true : false;
};

var retorna_zebra = function(i) {
  return isEven(i)? "zebra-white" : "zebra-blue";
};

var workout = {id:0};

var training = {};

var parser = function(text) {
  workout = text.workout;
};

function JSONRequest(text) {
   var head = document.getElementsByTagName("head")[0];
   var script = document.createElement('script');
   script.id = 'JsonOnDemand';
   script.type = 'text/javascript';
   //script.src = url;
   script.text = text;
   head.appendChild(script)
}

var parser_trainings = function(json){
  training = json.training;

  var template = "<a href='/trainings/"+training.id+"'>" +
  training.exercise.name + " - " + training.start + " | " + training.finish +
  "</a>";
  $("#list_of_trainings").append(template);
};

var cadastrar_training = function() {
  var json = {};
  json['training[workout_id]'] = workout.id;
  json['training[exercise_id]'] = $("#training_exercise_id").val();
  json['training[start(3i)]'] = $("#training_start_3i").val();
  json['training[start(2i)]'] = $("#training_start_2i").val();
  json['training[start(1i)]'] = $("#training_start_1i").val();
  json['training[start(4i)]'] = $("#training_start_4i").val();
  json['training[start(5i)]'] = $("#training_start_5i").val();

  json['training[finish(3i)]'] = $("#training_finish_3i").val();
  json['training[finish(2i)]'] = $("#training_finish_2i").val();
  json['training[finish(1i)]'] = $("#training_finish_1i").val();
  json['training[finish(4i)]'] = $("#training_finish_4i").val();
  json['training[finish(5i)]'] = $("#training_finish_5i").val();

  json['training[health_frequency]'] = $("#training_health_frequency").val();
  json['training[distance]'] = $("#training_distance").val();
  json['training[effort]'] = $("#training_effort").val();

    $.ajax({
       type: "POST",
       data: json,
       url: "/trainings.json",
       error: function(xhr, textStatus, errorThrown) {
         if(xhr.status == 406) { window.location = '/login'; }
       },
       success: function(data){
          var json = "parser_trainings(" + data + ")";
          JSONRequest(json);
       }
    });

};


var errorHandler = function(errors) {
  $("#errors").empty();
  for(var x in errors) {
    if($.isArray( errors[x] )) {
      var key = errors[x][0];
      var value = errors[x][1];
      $("#errors").append("Erro em "+key+": "+value);
    } else {
      $("#errors").append("Erro: " + errors[x]);
    }

  }
};

var cadastrar_weight = function() {
  var json = {};
  json['weight[user_id]'] = $("#weight_user_id").val();
  json['weight[weight]'] = $("#weight_weight").val();

    $.ajax({
       type: "POST",
       data: json,
       url: "/weights.json",
       error: function(xhr, textStatus, errorThrown) {
         if(xhr.status == 406) { window.location = '/login'; }
         var erros = "errorHandler(" + xhr.responseText + ")";
         JSONRequest(erros);
       },
       success: function(data){
        $("#errors").html("");
        $("#last_weight").text(data);

        $("#list_of_weights > table > tbody > tr").each(function(i, item){
          if(i > 0) $(item).remove();
        });

        $("#list_of_weights > table > tr").remove();
        $.getJSON("/weights.json?user_id=" + json['weight[user_id]'],
        function(data){
          $.each(data, function(i,item){
            if(i < 10) {
              $("<tr class='" + retorna_zebra(i) + "'><td>" + format_weight(item.weight.weight) +
                "</td><td>" + Date.parseDate(item.weight.created_at, 'Y-m-d\\TH:i:s\\Z').dateFormat('d/m/Y H:i:s') + "</td></tr>")
                .appendTo("#list_of_weights > table > tbody");
            }
          });
        });


       }
    });

};


var format_weight = function(value) {
  var retorno = "0.000";
  var index = value.toString().indexOf(".");
  if(index == -1) {
    retorno = value + ".000 kg";
  } else {
    var subs  = value.toString().substring(index + 1)
    var decimal = subs;
    if(decimal.length == 2) decimal += "0";
    if(decimal.length == 1) decimal += "00";
    retorno = value.toString().substring(0, index) + "." + decimal + " kg";
  }
  return retorno;
};


var montar_grafico = function(data, marcadores, labels) {
  var options = {
    data : data,
    legend      : ['Peso'],
    axis_labels : labels,
    size        : '960x300',
    type        : 'lc',
    chbg          : 'ffffff',
    bg            : 'EFF7FF',
    bg_type       : 'solid',
    colors: ['C40098'],
    chm: marcadores,
    fillarea : true,
    fillbottom : true,
    filltop : false
  };

  $("#workout_form_div").html('');
  //$('<input>').attr('id','weight_start').appendTo("#workout_form_div");
  //$('<input>').attr('id','weight_finish').appendTo("#workout_form_div");

  $('<img>')
    .attr('src', chart_api.make(options))
    .appendTo("#workout_form_div");
};

var chart_api = new jGCharts.Api();
$(function(){

  $("a[href='#weights_graph']").click(function(){

    $.ajax({
       type: "GET",
       url: "/weights.json",
       error: function(xhr, textStatus, errorThrown) {
         if(xhr.status == 406) { window.location = '/login'; }
       },
       success: function(data){
          var json = "var weights = " + data;
          JSONRequest(json);
          var data = [];
          var labels = [];
          var marcadores = "&chm=";
          for(x in weights) {
            marcadores += "t" + weights[x].weight.weight + "+kg,C40098,0," + x + ",15|";
            data = $.merge( data, [weights[x].weight.weight]);
            var dt = Date.parseDate(weights[x].weight.created_at, 'Y-m-d\\TH:i:s\\Z').dateFormat('d/m/Y')
            labels = $.merge( labels, [dt]);
          }
          marcadores = marcadores.substring(0, marcadores.length-1);
          montar_grafico(data, marcadores, labels);
       }
    });

  });


  $("a[href='#weight']").click(function(){
    $("#conteudo .container").load("/weights/new", "", function(){
        $("#weight_submit").click(cadastrar_weight);
    });
  });

  $("a[href='#workout']").click(function(){
    //cria o workout
    $.ajax({
       type: "POST",
       url: "/workouts.json",
       error: function(xhr, textStatus, errorThrown) {
         if(xhr.status == 406) { window.location = '/login'; }
       },
       success: function(data){
          var json = "parser(" + data + ")";
          JSONRequest(json);
          //carrega a pagina de form para training
          $("#workout_form_div").load("/trainings/new", "", function(){
            $("#workout_submit").click(cadastrar_training);
          });

       }
    });

  });
});

