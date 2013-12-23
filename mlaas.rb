$: << File.expand_path(File.dirname(__FILE__) + "/components")
require 'sinatra'
require 'sinatra/reloader'

enable :sessions

before do
  $logger = logger
end

get '/' do
  @page_heading = 'Index Page'
  @home_active = 'active'
  erb :index
end

get '/mock_algorithms' do
  @algorithms_active = "active"
  @page_heading = "Algorithms"
  erb :mock_algorithms
end

get '/mock_datasets' do
  @datasets_active = "active"
  @page_heading = "Datasets"
  erb :mock_datasets
end
