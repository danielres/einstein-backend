module V1
  class Groups < Grape::API

    resource :groups do

      desc 'Creates a new group.'
      post do
        AddingAGroup
          .new(current_user)
          .call(
            params,
            success: ->(resource){ GroupSerializer.new(resource, root: false) },
            failure: ->(resource){ status 400; resource.errors },
          )
      end


      desc 'Returns a group by id.'
      get '/:id' do
        ViewingAGroup
          .new(current_user)
          .call(
            params[:id],
            success: ->(resource){ GroupSerializer.new(resource, root: false) },
            failure: ->(resource){ status 404 },
          )

      end

      desc 'Returns a list of groups.'
      get do
        ViewingGroups
          .new(current_user)
          .call
      end


    end

  end
end
