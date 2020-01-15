class RepController < ApplicationController
    
    get '/reps/new' do
        @user = current_user
        erb :'reps/new'
    end

    post '/reps/new' do
        if params[:user]
            "Finding your rep"
        else
            "Creating your rep"
        end
    end

end