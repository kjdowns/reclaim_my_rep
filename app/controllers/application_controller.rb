class ApplicationController < Sinatra::Base
    
    configure do
        set :views, "app/views"
        enable :sessions
        set :session_secret, "toast"    
    end

    get '/' do
        erb :index
    end

end