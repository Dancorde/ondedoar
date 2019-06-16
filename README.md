# README

```console
rails g model Region name
rails g model State name acronym region:references
rails g model City name capital:boolean state:references
```

seeds.rb

```ruby
require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      region_obj = Region.find_or_create_by(:name => state["region"])
      state_obj = State.new(:acronym => state["acronym"], :name => state["name"], :region => region_obj)
      state_obj.save

      state["cities"].each do |city|
        c = City.new
        c.name = city["name"]
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save
	puts "Adicionando a cidade #{c.name} ao estado #{c.state.name}"
      end
    end
  end
end

BRPopulate.populate
```

adicionar no Gemfile

```
gem 'jquery-rails'
```

adicionar no application.js

```
//= require jquery
```

```console
bundle install
rails db:migrate
rails db:seed
```

institutions.coffee

```javascript
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
```

trocar

```
<%= form.text_field :city, class: "form-control" %>

<%= form.text_field :state, class: "form-control" %>
```

por

```
<%= form.grouped_collection_select :city, State.order(:name), :cities, :acronym, :name, :name, {include_blank: false}, class: "form-control" %>

<%= form.collection_select(:state, @states, :name, :acronym, {include_blank: false}, {:id => 'states_sected', :class => "form-control"}) %>
```