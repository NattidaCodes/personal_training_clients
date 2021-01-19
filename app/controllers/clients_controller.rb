class ClientsController < ApplicationController

    get '/clients/new' do
        # whatif a user is not logged in?
        if logged_in?
            erb :"/clients/new"
        else
            redirect "/login"
        end
    end

    post '/clients' do
        client = current_user.clients.create(params)
        if client.save
            redirect "/clients"
        else
            @errors = client.errors.full_messages.join(" - ")
            erb :"/clients/new"
        end
    end

    get '/clients' do
        # should someone not logged in be able to see all clients?
        if logged_in?
            @clients = Client.all

            erb :"/clients/index"
        else
            redirect "/login"
        end
    end

    get '/clients/:id' do
        # should someone not logged in be able to see the client?
        #in the view - should a user not associated to the client even see the edit or delete buttons?
        @client = Client.find_by(id: params[:id])
        if @client
            erb :"/clients/show"
        else
            redirect "/clients"
        end
    end

    get '/clients/:id/edit' do
        @client = Client.find_by(id: params[:id])
        if @client.user == current_user
            erb :"/clients/edit"
        else
            redirect "/clients"
        end
    end

    patch '/clients/:id/edit' do
        @client = Client.find_by(id: params[:id])
        if @client.user == current_user
            @client.update(params[:client])
            redirect "/clients/#{@client.id}"
        else
            redirect "/clients"
        end
    end

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