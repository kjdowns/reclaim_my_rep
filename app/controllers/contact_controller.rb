class ContactController < ApplicationController

    get '/contacts/new/:id' do
        @rep = Rep.find(params[:id])
        erb :'contacts/new'
    end

    post '/contacts/new/:id' do
        @contact = Contact.create(params[:contacts])
        current_user.contacts << @contact
        Rep.find(params[:id]).contacts << @contact 
        redirect "/contacts/show/#{params[:id]}"
    end

    get '/contacts/show' do
        @reps = current_user.reps
        erb :'contacts/show'
    end

    get '/contacts/show/:id' do
        @rep = Rep.find(params[:id])
        @contacts = Contact.where("rep_id = ? AND user_id = ?", @rep.id, current_user.id)
        erb :'contacts/show_id'
    end

end