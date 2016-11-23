var index = 0;
function addMoreFields() {
  index++;
  var objTo = document.getElementById('content');
  var divtest = document.createElement('div');
  divtest.innerHTML = '<div class="col-sm-6"><label for="page_ids_' + index + '">Page id</label> <div class="form-group"><input type="text" class="form-control" name="page_ids[]" value="" /></div></div><div class="col-sm-6"><label for="posts_limit_' + index + '">Posts number</label> <div class="form-group"><input type="text" class="form-control" name="posts_limit[]" value="" /></div>';

  objTo.appendChild(divtest)
}

function formatData(data) {
  var result = "user_id, page_id, post_id, post_type, interaction_type, interaction_sub_type, person_tagged_name\n";
  $.each(data[0], function(i, v) {
    $.each(v, function(index, value) {
      if (value) {
        result += '' + value['user_id'] + ',' + value['page_id'] + ',' + value['post_id']
          + ',' + value['post_type'] + ',' + value['interaction_type'] + ','
          + (value['interaction_sub_type'] || '') + ',' + (value['person_tagged_name'] || '') + "\n";
      }
    });
  });
  return result;
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
      }).success(function(data){
        console.log('success', data);
        $('#interactions').show();
        $('#interactions p').html(formatData(data));
      });
      return false;
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
