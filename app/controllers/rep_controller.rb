class RepController < ApplicationController
    
    get '/reps/new' do
        @user = current_user
        erb :'reps/new'
    end

    post '/reps/new' do
        params[:rep][:address] = params[:rep][:address].join(",")
        current_user.reps << Rep.create(params[:rep])
        redirect '/reps/show'
    end

    get '/find_my_reps' do
        result = RepAPI.get_reps('/representatives',{address: current_user.address, levels: 'country'})
        RepAPI.create_rep_from_api(result, 2, current_user)
        RepAPI.create_rep_from_api(result, 3, current_user)
        RepAPI.create_rep_from_api(result, 4, current_user)
        @user_reps = current_user.reps
        redirect '/reps/show'
    end

    get '/reps/home' do
        erb :'reps/show'
    end

    get '/reps/show' do
        erb :'reps/show'
    end

    get '/reps/edit/:id' do
        @rep = Rep.find(params[:id])
        if belongs_to_user?(@rep)
            erb :'reps/edit'
        end
    end

    patch '/reps/edit/:id' do
        params[:rep][:address] = params[:rep][:address].join(",")
        Rep.update(params[:id], params[:rep])
        redirect "/reps/show/#{params[:id]}"
    end

    get '/reps/show/:id' do
        @rep = Rep.find(params[:id])
        if belongs_to_user?(@rep)
            erb :'reps/show_id'
        end
    end

    get '/reps/delete/all' do
        Rep.where(user_id: current_user).destroy_all
        redirect '/reps/show'
    end

    get '/reps/delete/show/:id' do
        @rep = Rep.find(params[:id])
        if belongs_to_user?(@rep)
            @rep.destroy
        end
        redirect '/reps/show'
    end

    get '/reps/delete/:id' do
        @rep = Rep.find(params[:id])
        if belongs_to_user?(@rep)
            @rep.destroy
        end
        redirect '/reps/show'
    end

end