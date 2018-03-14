require './application'

use Rack::Session::Cookie,
  key: 'rack_app',
  domain: "localhost",
  path: '/',
  expire_after: 14400,
  secret: 'srsly'
use Rack::Reloader, 0
run Application.new
