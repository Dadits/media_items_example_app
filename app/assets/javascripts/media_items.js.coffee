$(document)
  .on 'change', '#media_type', ->
    $.ajax
      url: "/media_items/load_item_view"
      type: 'GET'
      data: { type: $("#media_type option:selected" ).attr('value') }
      
  .on 'click', 'form .remove_fields', (e) ->
    if $(this).parents('form').children('fieldset:visible').length > 1
      $(this).prev().children('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    e.preventDefault()
    
  .on 'click', 'form .add_fields', (e) ->
    time = new Date().getTime()
    reg = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(reg, time))
    e.preventDefault()