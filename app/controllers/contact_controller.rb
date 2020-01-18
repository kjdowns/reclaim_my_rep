class ContactController < ApplicationController

    get '/contacts/new/:id' do
        @rep = Rep.find(params[:id])
        erb :'contacts/new'
    end

    post '/contacts/new/:id' do
        @contact = Contact.create(params[:contacts])
        current_user.contacts << @contact
        Rep.find(params[:id]).contacts << @contact 
    end

end