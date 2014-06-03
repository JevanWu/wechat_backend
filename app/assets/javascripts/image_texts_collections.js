function remove_fields (link, modal){
  $(modal).find("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}
