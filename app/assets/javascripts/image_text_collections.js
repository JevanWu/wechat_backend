function remove_fields(link) {
  var modal = $(link).closest(".fields").children("img").data("target");
  $(modal).find("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, collection, field) {
  var new_id = new Date().getTime();
  var collection_regexp = new RegExp("new_collection", "g");
  var field_regexp = new RegExp("new_field", "g");
  $(link).before(collection.replace(collection_regexp, new_id)); 
  $("input[type=submit]").before(field.replace(field_regexp, new_id));
}
