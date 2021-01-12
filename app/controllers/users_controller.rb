class UsersController < ApplicationController

    get '/users' do
        @users = User.all

        erb :"/users/index"
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        if @user
            erb :"/users/show"
        else
            redirect "/users"
        end
    end
    
    get '/signup' do
        erb :"/users/signup"
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/users"
        else
            @errors = user.errors.full_messages.join(" - ")
            erb :"/users/signup"
        end
    end

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

    get '/logout' do
        session.clear
        redirect "/login"
    end
end