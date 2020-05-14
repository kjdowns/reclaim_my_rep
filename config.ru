require './config/environment'

use Rack::MethodOverride
use ContactController
use RepController
use UserController
use Rack::Static, :urls => ['/stylesheets', '/images'], :root => 'public'
run ApplicationController