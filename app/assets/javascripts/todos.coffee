@countTodos = ->
  count = $('#todos.sortable li').length
  $('.count-todos').html count
  return

@check_todo = (list_id, todo_id, obj) ->
  check_box = $(obj)
  if check_box.is(':checked')
    $("##{todo_id}_description").addClass("completed")
  else
    $("##{todo_id}_description").removeClass("completed")
  $.ajax
    url: "/lists/#{list_id}/todos/#{todo_id}"
    method: "PUT"
    data: {todo: {is_complete: check_box.is(':checked')}}

