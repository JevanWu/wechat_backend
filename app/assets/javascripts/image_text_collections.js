function remove_fields(link) {
  var modal = $(link).closest(".fields").children("img").data("target");
  $(modal).find("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, trigger, field) {
  var new_id = new Date().getTime();
  var trigger_regexp = new RegExp("new_trigger", "g");
  var field_regexp = new RegExp("new_field", "g");
  $(link).before(trigger.replace(trigger_regexp, new_id)); 
  $("input[type=submit]").before(field.replace(field_regexp, new_id));
}
