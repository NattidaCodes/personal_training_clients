class ClientsController < ApplicationController

    get '/clients/new' do
        erb :"/clients/new"
    end

    post '/clients' do
        client = current_user.clients.create(params)
        redirect "/clients"
    end

    get '/clients' do
        @clients = Client.all

        erb :"/clients/index"
    end

    get '/clients/:id' do
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