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
    @pet = Pet.new({name: params[:pet][:name]})
    if !params[:owner][:name].empty?
      @owner = Owner.create(params[:owner])
      @pet.owner_id = @owner.id
    else
      @pet.owner_id = params[:pet][:owner_ids].first.to_i
    end
    @pet.save
    redirect to "/pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find_by(id: params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find_by(id: params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  post '/pets/:id' do
    @pet = Pet.find_by(id: params[:id])
    @pet.name = params[:pet][:name]
    if !params[:owner][:name].empty?
      @owner = Owner.create(params[:owner])
      @pet.owner_id = @owner.id
    else
      @pet.owner_id = params[:pet][:owner_ids].first.to_i
    end
    @pet.save
    redirect to "/pets/#{@pet.id}"
  end

end
