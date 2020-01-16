class RepController < ApplicationController
    
    get '/reps/new' do
        @user = current_user
        erb :'reps/new'
    end

    post '/reps/new' do
            "Creating your rep"
    end

    get '/find_my_reps/' do
        @user = current_user
        result = RepApi.get_reps('/representatives',{address: @user.address, levels: 'country'})
        sen1 = result[2]
        sen2 = result[3]
        rep1 = result[4]
    end

end