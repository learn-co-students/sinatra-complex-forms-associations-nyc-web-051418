class PetsController < ApplicationController
  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' # ok
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    unless params['owner']['name'].empty?
      @pet.owner = Owner.create(name: params['owner']['name'])
    end
    @pet.save
    redirect "pets/#{@pet.id}"
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new' # ok
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params['pet'])
    unless params['owner']['name'].empty?
      @pet.owner = Owner.create(name: params['owner']['name'])
      @pet.save
    end
    redirect to "pets/#{@pet.id}" # ok
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show' # ok
  end

  get '/pets/:id/edit' do
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    erb :'/pets/edit' # ok
  end
end
