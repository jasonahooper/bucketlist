$(document).ready(function() {
  $('body').on('click', '.sortHeading', function(clicked) {
    console.log(clicked.currentTarget.id);
    var id = clicked.currentTarget.id;
    var destination = id.substr(id.indexOf("-")+1);
    var data = id.substr(0, id.indexOf("-"));
      $.ajax({
        data: { sort: data},
        url: '/destinations/' + destination + '/to_dos.js',
        success: function(data) {
          console.log(data);
        }
      });
    return(false);
  })
});