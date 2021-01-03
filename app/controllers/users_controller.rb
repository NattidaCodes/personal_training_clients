class UsersController < ApplicationController

    #Signup
    #Load form
    get '/signup' do
        erb :"users/signup"
    end

    #Process form and create user
    post '/signup' do
        ##Create user and log them in
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/clients"
        else
            @errors = user.errors.full_messages.join(" - ")
            erb :"users/signup"
        end
    end

    #Login

    #Logout
    
end