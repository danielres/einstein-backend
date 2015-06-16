module Acme
  class Post < Grape::API
    desc 'Creates a spline that can be reticulated.'
    resource :spline do
      params do
        requires :reticulated, type: Boolean
      end
      post do
        { reticulated: params[:reticulated] }
      end
    end
  end
end
