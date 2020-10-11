class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    
    shelters = Shelter.new({
      name: params[:shelters][:name],
      address: params[:shelters][:address],
      city: params[:shelters][:city],
      state: params[:shelters][:state],
      zip: params[:shelters][:zip]
    })
    shelters.save
    redirect_to '/shelters'
  end
  
  def show
    @shelters = Shelter.find(params[:id])
  end

  def edit
    @shelters = Shelter.find(params[:id])
  end

  def update 
    shelters = Shelter.find(params[:id])
  shelters.update({
    name: params[:shelters][:name],
    address: params[:shelters][:address],
    city: params[:shelters][:city],
    state: params[:shelters][:state],
    zip: params[:shelters][:zip],
    })
  shelters.save
  redirect_to "/shelters/#{shelters.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
  redirect_to '/shelters'
  end
end