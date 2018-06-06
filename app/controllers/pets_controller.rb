class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(name: params["pet_name"])
    if !params["owner_name"].empty?
      @pet.owner_id = Owner.create(name: params["owner_name"]).id
    else
      @pet.owner_id = params["owner_id"]
    end
    @pet.save

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pet = Pet.find(params["id"])
    @pet.update(params["pet"])

    if !params["owner"]["name"].empty?
      @pet.owner_id = Owner.create(name: params["owner"]["name"]).id
    else
      @pet.owner_id = params["owner"]["id"]
    end
    @pet.save

    redirect to "pets/#{@pet.id}"
  end
end
