var Tags = {
  rename: function(url, name, token) {
    new_name = prompt("Enter the name for this tag:", name);
    if(new_name && new_name != name) {
      params = encodeURIComponent("tag[name]") + "=" + encodeURIComponent(new_name) +
        "&authenticity_token=" + encodeURIComponent(token);

      new Ajax.Request(url, {
        asynchronous:true,
        evalScripts:true,
        method:'put',
        parameters:params
      });
    }
  },

  deleteTag: function() {
    if($('delete_form').down('fieldset')) {
      $('delete_form').show();
      $('data').hide();
    } else if(confirm("Are you sure want to delete this tag?")) {
      $('delete_form').down('form').submit();
    }
  },

  applyFilter: function(url) {
    start_date = $('start_time').getValue();
    end_date = $('end_time').getValue();
    window.location.href = url + "?start=" + start_date + "&end=" + end_date;
  },

  clearFilter: function(url) {
    $('start_time').setValue('');
    $('end_time').setValue('');
    Tags.applyFilter(url);
  },

  toggleFilter: function() {
    $('filter').toggle();
  },

  confirmDelete: function() {
    if($('mergeTagOption').down('input').checked) {
      if($('receiver_id').selectedIndex <= 0) {
        alert("If you want to merge tags, you must select a tag to merge with.");
        $('receiver_id').focus();
        return false;
      }
    } else {
      $('receiver_id').selectedIndex = 0;
    }

    return confirm("Are you sure you want to delete this tag?");
  },

  cancelDelete: function() {
    $('delete_form').down('form').reset();
    Tags.selectDeleteTag();
    $('delete_form').hide();
    $('data').show();
  },

  selectDeleteTag: function() {
    $('receiver_id').selectedIndex = 0;
    $('deleteTagOption').addClassName('selected');
    $('mergeTagOption').removeClassName('selected');
  },

  selectMergeTag: function() {
    $('mergeTagOption').addClassName('selected');
    $('deleteTagOption').removeClassName('selected');
  }
}
