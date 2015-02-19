$(document).ready(function() {
  $(".fa").click(function(event){
    event.preventDefault();

    var request = $.ajax({
      url: '/videos/' + id + '/like',
      method: 'get',
      data: $(this).serialize()
    });

    request.done(function(response){
    });
  })
});
