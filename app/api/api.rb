class API < Grape::API
  prefix 'api'
  format :json
  mount Sample::Ping
  mount Sample::Raise
  mount Sample::Protected
  mount Sample::Post
  mount V1::Groups
end
