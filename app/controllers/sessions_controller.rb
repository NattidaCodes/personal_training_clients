class SessionsController < ApplicationController

    #Signup
    #Load form
    get '/signup' do
        erb :"sessions/signup"
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
            erb :"sessions/signup"
        end
    end

    #Login
    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect "/clients"
        else
            redirect "/login"
        end
    end

    #Logout
    get '/logout' do
        session.clear
        redirect "/login"
    end
    
end