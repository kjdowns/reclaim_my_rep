class ContactController < ApplicationController

    get '/contacts/new/:id' do
        @rep = Rep.find(params[:id])
        erb :'contacts/new'
    end

end