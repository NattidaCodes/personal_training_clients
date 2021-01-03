class ClientsController < ApplicationController

    #new - loads a form
    get '/clients/new' do
        erb :"/clients/new"
    end

    #create - process the form and creates a user
    post '/clients' do
        client = Client.create(params)
        redirect "/clients"
    end

    #index - loads all clients
    get '/clients' do
        @clients = Client.all

        erb :"/clients/index"
    end

    #show - get details on an indiviual user
    get '/clients/:id' do
        @client = Client.find_by(id: params[:id])
        if @client
            erb :"clients/show"
        else
            redirect "/clients"
        end
    end

    #edit - loading a form to edit a client
    get '/clients/:id/edit' do
        @client = Client.find_by(id: params[:id])

        erb :"clients/edit"
    end

    #update
    patch '/clients/:id/edit' do
        @client = Client.find_by(id: params[:id])
        @client.update(params[:client])
        redirect "/clients/#{@client.id}"
    end

    #delete
    delete "/clients/:id" do
        @client = Client.find_by(id: params[:id])
        @client.destroy
        redirect "/clients"
    end

end