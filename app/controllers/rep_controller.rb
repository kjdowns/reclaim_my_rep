class RepController < ApplicationController
    
    get '/reps/new' do
        @user = current_user
        erb :'reps/new'
    end

    post '/reps/new' do
            "Creating your rep"
    end

    get '/find_my_reps' do
        result = RepAPI.get_reps('/representatives',{address: current_user.address, levels: 'country'})
        RepAPI.create_rep_from_api(result, 2, current_user)
        RepAPI.create_rep_from_api(result, 3, current_user)
        RepAPI.create_rep_from_api(result, 4, current_user)
        @user_reps = current_user.reps
        "Reps Added!"
    end

end