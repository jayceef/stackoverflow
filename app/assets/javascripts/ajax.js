$(document).ready(function() {
  voteup();
  votedown();
  newquestion();
  addquestion();
  newAnswer();

});

var newAnswer = function(){
  $(".new_answer").on('submit', function(event){
    event.preventDefault()
    console.log("clicked")
console.log('clicked')
    formdata = $(this).serialize()
    console.log("before")
    console.log(formdata)
    console.log("after")
    console.log("after again")


    $.ajax({
      url: '/answers/',
      type: 'post',
      data: formdata,
      datatype: 'json',

    })
    .done(function(response) {
      console.log("success");
      $('.answer_container').append(response)
    })
    .fail(function() {
      console.log("error");
    })
    .always(function(response) {
      console.log(response)
    });

  })
}

var voteup = function() {
  $('.container').delegate(".voteup a", "click", function(event){
    event.preventDefault()

    id = $(".question")
    var url = $(this).attr('href')

   $.ajax({
      url: url,
      type: 'post',
      datatype: 'json'
    })
    .done(function(response) {
      console.log(response.id);
    $('#'+response.id).text(response.votes + " likes")
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  })
}

var votedown = function() {
  $('.container').delegate(".votedown a", "click", function(event){
    event.preventDefault()

    id = $(".question")
    var url2 = $(this).attr('href')
    console.log(id)

   $.ajax({
      url: url2,
      type: 'post',
      datatype: 'json'
    })
    .done(function(response) {
      console.log(response.id);
    $('#'+response.id).text(response.votes + " likes")
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });


  })
}

var newquestion = function() {
  $('#newqbutton').on('click', function(event){
    event.preventDefault()

    $.ajax({
      url: '/questions/new/'
    })

    .done(function() {
      console.log("success");
      $('.newquestion').show()
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  })
}

var addquestion = function(){
  $('.new_question').on('submit', function(event){
    event.preventDefault()
    console.log("clicked")


    formdata = $(this).serialize()
    console.log("before")
    console.log(formdata)
    console.log("after")

    $.ajax({
      url: '/questions',
      type: 'post',
      data: formdata,
      datatype: 'json',

    })
    .done(function(response) {
      console.log("success");
      $('.list').append(response)
    })
    .fail(function() {
      console.log("error");
    })
    .always(function(response) {
      console.log(response)
    });

  })
}

