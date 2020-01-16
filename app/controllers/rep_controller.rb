class RepController < ApplicationController
    
    get '/reps/new' do
        @user = current_user
        erb :'reps/new'
    end

    post '/reps/new' do
        params[:rep][:address] = params[:rep][:address].join(",")
        current_user.reps << Rep.create(params[:rep])
        redirect '/reps/home'
    end

    get '/find_my_reps' do
        result = RepAPI.get_reps('/representatives',{address: current_user.address, levels: 'country'})
        RepAPI.create_rep_from_api(result, 2, current_user)
        RepAPI.create_rep_from_api(result, 3, current_user)
        RepAPI.create_rep_from_api(result, 4, current_user)
        @user_reps = current_user.reps
        "Reps Added!"
    end

    get '/reps/home' do
        erb :'reps/home'
    end

    get '/reps/show' do
        erb :'reps/show'
    end

    get '/reps/edit/:id' do
        "Edit page for #{params[:id]}"
    end

end