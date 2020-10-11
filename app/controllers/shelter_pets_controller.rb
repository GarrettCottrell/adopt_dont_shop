class ShelterPetsController < ApplicationController
  def index
    @shelters = Shelter.find(params[:id])
    @pets = @shelters.pets
  end

  def new
    @shelters = Shelter.find(params[:id])
  end

  def create
    pets = Pet.new({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      age: params[:age],
      sex: params[:sex],
      adoption_status: params[:adoption_status],
      shelter_id: params[:shelter_id]
                 })
    pets.save
    redirect_to "/shelters/#{pets.shelter_id}/pets"
  end
end
