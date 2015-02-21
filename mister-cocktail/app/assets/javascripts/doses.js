$(function() {

  $('form').validate({
    rules: {
      "dose[description]": {
        required: true
      }
    }
  });

  $("#ingredients").select2();

});
