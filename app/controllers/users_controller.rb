class UsersController < ApplicationController
    #Index - Loads all Users
    get '/users' do
        @users = User.all

        erb :"/users/index"
    end

    #Show - Details on individual/redirects if :id is nil
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        if @user
            erb :"/users/show"
        else
            redirect "/users"
        end
    end
    
    #Signup
    #Load form
    get '/signup' do
        erb :"/users/signup"
    end

    #Process form and create user
    post '/signup' do
        ##Create user and log them in
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/users"
        else
            @errors = user.errors.full_messages.join(" - ")
            erb :"/users/signup"
        end
    end

    #Login
    get '/login' do
        erb :"/users/login"
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