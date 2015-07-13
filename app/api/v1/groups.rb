module V1
  class Groups < Grape::API

    resource :groups do

      desc 'Creates a new group.'
      post do
        AddingAGroup
          .new(User.new)
          .call(
            params,
            success: ->(resource){ resource },
            failure: ->(resource){ status 400; resource.errors },
          )
      end


      desc 'Returns a group by id.'
      get '/:id' do
        ViewingAGroup
          .new(User.new)
          .call(
            params[:id],
            success: ->(resource){ GroupSerializer.new(resource, root: false) },
            failure: ->(resource){ status 404 },
          )

      end

      desc 'Returns a list of groups.'
      get do
        ViewingGroups
          .new(User.new)
          .call
      end


    end

  end
end
