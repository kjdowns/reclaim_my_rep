require 'rack-flash'
class ApplicationController < Sinatra::Base
    use Rack::Flash, :sweep => true
    
    configure do
        set :views, "app/views"
        enable :sessions
        set :session_secret, "toast"
    end

    before do
        if request.path != '/' 
            if request.path != '/users/login' 
                if request.path != '/users/signup'
                    if !logged_in?
                        redirect '/'
                    end
                end
            end
        end
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

        def exists?(attr)
            !!attr
        end

        def normalize_contact(contact, type)
            if contact.include? "#{type}"
                contact
            else
                s = "https://www.#{type}.com/#{contact}"
            end
        end

        def belongs_to_user?(model)
            (model.user_id) == current_user.id
        end

        def redirect_if_not_allowed(model)
            if !belongs_to_user?(model)
                redirect '/'
            end
        end

    end

end
