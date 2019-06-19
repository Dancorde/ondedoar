# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  cities = $('#city_city_id').html()
  $('#city_city_id').parent().hide()
  $('#need').parent().hide()
  $('#state').change ->
    state = $('#state :selected').text()
    
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#city_city_id').html(options)
      $('#city_city_id').parent().show()

  $('#city_city_id').change ->
    $('#need').parent().show()