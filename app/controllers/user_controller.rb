class UserController < ApplicationController
    
    get '/users/login' do
        erb :'users/login'
    end

    get '/users/signup' do
        erb :'users/signup'
    end

    post '/users/signup' do
        #Create user and navigate to home page
        "You just signed up!"
    end

end