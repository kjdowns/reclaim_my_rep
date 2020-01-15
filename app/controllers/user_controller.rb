class UserController < ApplicationController
    
    get '/users/login' do
        erb :'users/login'
    end

    post '/users/login' do
        # Log user in and navigate to home page
    end

    get '/users/signup' do
        erb :'users/signup'
    end

    post '/users/signup' do
        #Create user and navigate to home page
        if !User.find_by username: params[:user][:username]
            @user = User.create(params[:user])
            session[:user_id] = @user.id
        else 
            "This user already exists"
        end
    end

end