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

    get '/contacts/edit/:id' do
        @contact = Contact.find(params[:id])
        if belongs_to_user?(@contact)
            erb :'contacts/edit'
        end
    end

    patch '/contacts/edit/:id' do
        Contact.update(params[:id], params[:contacts])
        redirect "/contacts/show/#{Contact.find(params[:id]).rep_id}"
    end

    get '/contacts/delete/:id' do
        @rep_id = Contact.find(params[:id]).rep_id
        @contact = Contact.find(params[:id])
        if belongs_to_user?(@contact)
            @contact.destroy
        end
        redirect "/contacts/show/#{@rep_id}"
    end

end