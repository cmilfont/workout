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

var Weight = {

  format_weight: function(value) {
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
  },

  updateTable: function(data) {

    if( $("#list_of_weights").size() == 0 ) {

      $("<tr><th>Peso</th><th>Data</th></tr>").appendTo(
        $("<tbody>").appendTo(
          $("<table>").appendTo(
            $("<div>").attr("id", "list_of_weights")
                      .css( {
                          position: 'absolute',
                          top: 35,
                          left: 650,
                          width: '350px',
                          border: '1px solid #eee',
                          padding: '2px',
                      })
                      .appendTo("#conteudo .container > #placeholder")
          )
        )
      );

    }

    $("#errors").html("");

    $("#list_of_weights > table > tbody > tr").each(function(i, item){
      if(i > 0) $(item).remove();
    });

    $("#list_of_weights > table > tr").remove();
    $.each(data, function(i,item){
      if(i < 10) {
        $("<tr class='" + retorna_zebra(i) + "'><td>" + Weight.format_weight(item.weight.weight) +
          "</td><td>" + Date.parseDate(item.weight.created_at, 'Y-m-d\\TH:i:s\\Z').dateFormat('d/m/Y H:i:s') + "</td></tr>")
          .appendTo("#list_of_weights > table > tbody");
      }
    });

  },

  submitWeight: function() {
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
          $("#last_weight").text(data);
          $.getJSON("/weights.json?user_id=" + json['weight[user_id]'],
          function(data){
            Weight.updateTable(data);
          });
       }
    });
  },

  submitWeightGoal: function() {
    var json = {};
    json['weight_goal[user_id]'] = $("#weight_goal_user_id").val();
    json['weight_goal[weight]'] = $("#weight_goal_weight").val();
    json['weight_goal[goal(3i)]'] = $("#weight_goal_goal_3i").val();
    json['weight_goal[goal(2i)]'] = $("#weight_goal_goal_2i").val();
    json['weight_goal[goal(1i)]'] = $("#weight_goal_goal_1i").val();

    $.ajax({
       type: "POST",
       data: json,
       url: "/weight_goals.json",
       error: function(xhr, textStatus, errorThrown) {
         if(xhr.status == 406) { window.location = '/login'; }
         var erros = "errorHandler(" + xhr.responseText + ")";
         JSONRequest(erros);
       },
       success: function(data){
          $("#last_goal_weight").text($("#weight_goal_weight").val());
       }
    });
  },

  ajaxGoalForm : function() {
    $("#conteudo .container").load("/weight_goals/new", "", function(){
      $("#weight_goal_submit").click(Weight.submitWeightGoal);
    });
  },

  ajaxForm: function() {
    $("#conteudo .container").load("/weights/new", "", function(){
      $("#weight_submit").click(Weight.submitWeight);
    });
  },

  ajaxChart: function() {

    $.getJSON("/weights.json?user_id=" + $('#user_id').val(),
    function(data){
      var dados = [];
      $.each(data, function(i,item){
        if(i < 10) {
          var dt = Date.parseDate(item.weight.created_at, 'Y-m-d\\TH:i:s\\Z')
                      .getTime();
          dados.push([ dt, item.weight.weight ]);
          //dados = $.merge( dados, [] );
        }
      });

      Weight.plot("#conteudo .container", dados);
      Weight.updateTable(data);
    });

  },

  plot: function(destino, data){

    series = {
      label: 'Período', data: data,
      //threshold: { below: parseFloat(90.0), color: "rgb(200, 20, 30)" },
      points: { radius: 5, show: true }
    };

    $('<div>')
              .attr('id', "placeholder")
              .attr("style", "width:600px;height:300px;")
              .appendTo( $(destino).empty() );


    var options = {
        crosshair: { mode: "x" },
        color: "rgb(30, 180, 20)",
        clickable: true,
        hoverable: true,
        shadowSize: 1,
        xaxis: {
          mode: "time" , timeformat: "%d/%m", minTickSize: [1, "day"]
        },
        yaxis:  { autoscaleMargin: 0.5   },
        lines:  { show: true, steps: false },
        points: { show: true, fill: true },
        grid:   {
          backgroundColor: { colors: ["#fff", "#eee"] } ,
          hoverable: true, clickable: true
        }
    };
    placeholder = $("#placeholder");
    plot = $.plot(placeholder, [series], options);

    placeholder.bind("plothover",  function (event, pos, item) {
      if(item) {
        $('<div id="tooltip">' + Weight.format_weight(item.datapoint[1]) + " em " + new Date(item.datapoint[0]).dateFormat('d/m/Y H:i:s')  + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: item.pageY + 5,
            left: item.pageX + 5,
            border: '1px solid #fdd',
            padding: '2px',
            'background-color': '#fee',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
      } else {
        $('#tooltip').remove();
      }
    });

    placeholder.bind("plotclick", function (event, pos, item) {
      if (item) {
        datapoint_data = new Date(item.datapoint[0]).dateFormat('d/m/Y H:i:s');
        datapoint_peso = Weight.format_weight(item.datapoint[1]);
        $("#list_of_weights > table > tbody > tr").each(function(){
          var peso = $(this).children()[0];
          var data = $(this).children()[1];
          if( (datapoint_data == $(data).text()) && (datapoint_peso == $(peso).text()) ) {
            $(this).attr("class", "zebra-blue");
          } else {
            $(this).attr("class", "zebra-white");
          }
        });
      }
    });


  }
};

$(function(){

  $("a[href='#weights_graph']").click(function(){
    Weight.ajaxChart();
  });

  $("a[href='#weight']").click(function(){
    Weight.ajaxForm();
  });

  $("a[href='#weight_goal']").click(function(){
    Weight.ajaxGoalForm();
  });

/*
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
  });*/

});

