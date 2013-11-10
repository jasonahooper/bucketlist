$(document).ready(function() {
  $('body').on('click', '.sortHeading', function(clicked) {
    var id = clicked.currentTarget.id;
    var destination = id.substr(id.indexOf("-")+1);
    var data = id.substr(0, id.indexOf("-"));
    if (data === "created_at") {
      data = data + " DESC"
    }
      $.ajax({
        data: { sort: data},
        url: '/destinations/' + destination + '/to_dos.js',
        success: function(data) { }
      });
    return(false);
  })
});