# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load_summer_note = ->

  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('#image_text_body')


  #to call summernote editor
  summer_note.summernote
    # to set options
    height:300
    #lang: 'ko-KR'
    # toolbar: [
      # ['insert', ['picture', 'link']], // no insert buttons
      # ["table", ["table"]],
      # ["style", ["style"]],
      # ["fontsize", ["fontsize"]],
      # ["color", ["color"]],
      # ["style", ["bold", "italic", "underline", "clear"]],
      # ["para", ["ul", "ol", "paragraph"]],
      # ["height", ["height"]],
      # ["help", ["help"]]
                                                                                                                                             #]

    # to set code for summernote
    # content = summer_note.code()
    # summer_note.html("<div><h1>html</h1></div>")
    # summer_note.code("<h1>works!</h1>")
    # alert summer_note.text()
    summer_note.code summer_note.html()
    # alert summer_note.code()

    # to get code for summernote
    summer_note.closest('form').submit ->

      # alert $('#post_content').code()
      summer_note.html summer_note.code()
      true

$(document).ready(load_summer_note)
$(document).on "page:load", load_summer_note
