json.extract! institution, :id, :name, :email, :phone, :address, :city, :state, :needs, :description, :created_at, :updated_at
json.url institution_url(institution, format: :json)
