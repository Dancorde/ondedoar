class PagesController < ApplicationController
  def home
    @states = State.all
    @cities = City.all
  end

  def search
    @institutions = Institution
      .where('state LIKE ? AND city LIKE ? AND necessidade LIKE ?', params[:state], params[:city][:city_id], params[:need])
      .joins(:needs)
  end

  def criadores
  end

  def contato
  end
end
