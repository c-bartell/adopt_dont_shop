class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    Shelter.create(
      name: params[:name_new_shelter],
      address: params[:address_new_shelter],
      city: params[:city_new_shelter],
      state: params[:state_new_shelter],
      zip: params[:zip_new_shelter]
    )

    redirect_to('/shelters')
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    Shelter.update(params[:id], {
        name: params[:name],
        address: params[:address],
        city: params[:city],
        state: params[:state],
        zip: params[:zip]
      }
    )
    redirect_to('/shelters')
  end
end
