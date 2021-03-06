require 'rack-flash'
class UserController < ApplicationController
    
    get '/users/login' do
        erb :'users/login'
    end

    post '/users/login' do
        user = User.find_by(:username => params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect '/reps/show'
        else
            flash[:message] = "Invalid username or password. Please try again."
            redirect :'users/login'
        end
    end

    get '/users/logout' do
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
            redirect '/reps/show'
        else 
            flash[:message] = "This user already exists. Please choose a different username."
            redirect :'/users/signup'
        end
    end

    get '/users/profile' do
        erb :'users/profile'
    end

    get '/users/edit' do
        erb :'users/edit'
    end

    patch '/users/edit' do
        if current_user.authenticate(params[:user][:current_password])
            User.update(current_user.id, name: params[:user][:name], address: params[:user][:address], username: params[:user][:username])
            if !params[:user][:password].empty?
                User.update(current_user.id, password: params[:user][:password])
            end
            redirect 'users/profile'
        else
            flash[:message] = "Incorrect password. Please try again."
            redirect :'/users/edit'
        end
    end

    get '/users/delete' do
        current_user.destroy
        redirect '/'
    end

end