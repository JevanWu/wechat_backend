#= require load-summernote

$ ->
  window.NewsAsset = []
  window.NewsAsset.remove_fields = (link) ->
    modal = $(link).closest(".fields").children("img").data("target")
    $(modal).find("input[type=hidden]").val("1")
    $(link).closest(".fields").hide()

  window.NewsAsset.add_fields = (link, collection, field) ->
    new_id = new Date().getTime()
    collection_regexp = new RegExp("new_collection", "g")
    field_regexp = new RegExp("new_field", "g")
    $(link).before(collection.replace(collection_regexp, new_id))
    $("input[type=submit]").before(field.replace(field_regexp, new_id))
    $(loadSummernote)
