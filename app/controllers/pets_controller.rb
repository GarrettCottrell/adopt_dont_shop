class PetsController < ApplicationController
  def index
    @pets = Pets.all
  end
  def create
    pets = Shelter.pet.new({
      name: params[:pet][:name]
    })


    #HAVE ACCESS TO SHELTER ID - CAN LOOK UP SHELTER ID NOW. DO SHELTER=SHELTER.FIND(PARAMS SHELTERID)
  end
end
