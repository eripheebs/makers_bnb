ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/sign_up'
require_relative 'controllers/log_in'
require_relative 'data_mapper_setup'
require_relative 'controllers/new_space'
require_relative 'controllers/request'
require_relative 'controllers/spaces'
require_relative 'controllers/homepage'
require_relative 'controllers/manage_requests'
require_relative 'controllers/user_spaces'
