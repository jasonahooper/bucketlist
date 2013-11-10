$(document).ready(function() {
  $('body').on('click', '.remove-todo', function(clicked) {
    console.log(clicked);
//    clicked.currentTarget.parentElement.parentElement.remove()
    return(false);
  });
});