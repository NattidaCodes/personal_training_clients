class ClientsController < ApplicationController

    #new - display the form to make a new thing
    get '/clients/new' do
        erb :"/clients/new"
    end

    #create - process the form and creates a user
    post '/clients' do
        client = current_user.clients.create(params)
        redirect "/clients"
    end

    #index - loads all clients
    get '/clients' do
        @clients = Client.all

        erb :"/clients/index"
    end

    #show - details on an indiviual user
    get '/clients/:id' do
        @client = Client.find_by(id: params[:id])
        if @client
            erb :"/clients/show"
        else
            redirect "/clients"
        end
    end

    #edit - display form to make changes
    get '/clients/:id/edit' do
        @client = Client.find_by(id: params[:id])
        if @client.user == current_user
            erb :"/clients/edit"
        else
            redirect "/clients"
        end
    end

    #update - processes the form and makes the change
    patch '/clients/:id/edit' do
        @client = Client.find_by(id: params[:id])
        if @client.user == current_user
            @client.update(params[:client])
            redirect "/clients/#{@client.id}"
        else
            redirect "/clients"
        end
    end

    #delete - process the form and destroys the thing
    delete "/clients/:id" do
        @client = Client.find_by(id: params[:id])
        if @client.user == current_user
            @client.destroy
            redirect "/clients"
        else
            redirect "/clients"
        end
    end
end