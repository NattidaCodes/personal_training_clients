class ClientsController < ApplicationController

    get '/clients' do
        @clients = Client.all

        erb :"/clients/index"
    end

    get '/clients/:id' do
        @client = Client.find_by(id: params[:id])

        erb :"/clients/show"
    end

end

    #new - loads a form

    #create - process the form and creates a user

    #index - loads all coaches

    #show - get details on an indiviual user

    #edit - loading a form to edit a client

    #update

    #delete