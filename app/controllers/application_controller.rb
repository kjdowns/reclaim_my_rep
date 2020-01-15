class ApplicationController < Sinatra::Base
    
    configure do
        set :views, "app/views"
        enable :sessions
        set :session_secret, "toast"    
    end

    get '/' do
        erb :index
    end

    helpers do
        
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end

    end

end