var index = 0;
function addMoreFields() {
  index++;
  var objTo = document.getElementById('content');
  var divtest = document.createElement('div');
  divtest.innerHTML = '<label for="page_id_' + index + '">Page id</label> <div class="form-group"><input type="text" class="form-control" name="page_id[]" value="" /></div>';

  objTo.appendChild(divtest)
}

var ready = function() {
  $('form').submit(function() {
    if ($('#csv').prop('checked') == false) {
      var valuesToSubmit = $(this).serialize();
      $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: valuesToSubmit,
        dataType: 'JSON'
      }).success(function(json){
        console.log('success', json);
        $('#interactions').show();
        $('#interactions p').html(JSON.stringify(json));
      });
      return false;
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
