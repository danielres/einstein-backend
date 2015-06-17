class API < Grape::API
  prefix 'api'
  format :json
  mount Sample::Ping
  mount Sample::Raise
  mount Sample::Protected
  mount Sample::Post
end
