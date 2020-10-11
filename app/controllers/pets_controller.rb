class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pets = Pet.find(params[:id])
  end
  def edit
    @pets = Pet.find(params[:id])
  end
  def update
    pets = Pet.find(params[:id])
  pets.update({
    image: params[:image],
    name: params[:name],
    description: params[:description],
    age: params[:age],
    sex: params[:sex],
    })
  pets.save
  redirect_to "/pets/#{pets.id}"
  end

  def destroy
    Pet.destroy(params[:id])
  redirect_to '/pets'
  end
end
