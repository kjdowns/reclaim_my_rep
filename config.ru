require './config/environment'

use Rack::MethodOverride
use ContactController
use RepController
use UserController
run ApplicationController

use Rack::Static, :urls => ['/stylesheets', '/images'], :root => 'public'