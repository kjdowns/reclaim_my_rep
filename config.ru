require './config/environment'

use Rack::MethodOverride

map "/public" do
    run Rack::Directory.new("./public")
end

use ContactController
use RepController
use UserController
run ApplicationController