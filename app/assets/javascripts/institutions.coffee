# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  cities = $('#institution_city').html()
  $('#states_sected').change ->
    state = $('#states_sected :selected').text()
    
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#institution_city').html(options)
      $('#institution_city').parent().show()
    else
      $('#institution_city').value("Selecione um estado primeiro")
      $('#institution_city').parent().hide()
      