require './config/environment'

use Rack::MethodOverride
use ContactController
use RepController
use UserController
# run ApplicationController
run Sinatra::Application