class ShelterPetsController < ApplicationController
  def index
    @shelters = Shelter.find(params[:id])
    @pets = @shelters.pets
  end
end