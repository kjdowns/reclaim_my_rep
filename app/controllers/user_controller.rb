class UserController < ApplicationController
    
    get '/users/login' do
        erb :'users/login'
    end

    post '/users/login' do
        user = User.find_by(:username => params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect '/reps/home'
        end
    end

    get 'users/logout' do
        session.clear
        redirect '/'
    end

    get '/users/signup' do
        erb :'users/signup'
    end

    post '/users/signup' do
        params[:user][:address] = params[:user][:address].join(" ")
        @user = User.new(params[:user])
        if @user.save
            session[:user_id] = @user.id
            redirect '/reps/home'
        else 
            "This user already exists"
        end
    end

    

end