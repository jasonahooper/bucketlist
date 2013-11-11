$(document).ready(function() {
  $('body').on('click', '.remove-todo', function(clicked) {
    console.log(clicked);
    id = clicked.currentTarget.parentElement.parentElement.id.substr(6)
//    clicked.currentTarget.parentElement.parentElement.remove()
    $.ajax({
      data: { id: id},
      method: "DELETE",
      url: '/to_dos/' + id + '.js',
      success: function(data) {
        console.log(data);
      }
    });
    return(false);
  });
});