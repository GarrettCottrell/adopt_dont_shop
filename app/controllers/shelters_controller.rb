class SheltersController < ApplicationController
  def index
    @shelters = Shelters.all
  end

  def new
  end

  def create
    
    shelters = Shelters.new({
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
    @shelters = Shelters.find(params[:id])
  end

  def edit
    @shelters = Shelters.find(params[:id])
  end

  def update 
    shelters = Shelters.find(params[:id])
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
    Shelters.destroy(params[:id])
  redirect_to '/shelters'
  end
end