class PagesController < ApplicationController
  def home
    @states = State.all
    @cities = City.all
  end

  def search
    @institutions = Institution.all
  end
end
