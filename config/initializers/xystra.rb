Xystra.configure do |config|
  config.graph_api_token  = ENV['GRAPH_API_ACCESS_TOKEN']
  config.graph_api_secret = ENV['GRAPH_API_APP_SECRET']
end
