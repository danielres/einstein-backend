module V1
  class Groups < Grape::API

    resource :groups do

      desc 'Creates a new group.'
      post do
        AddingAGroup
          .new(User.new)
          .call(
            params[:group],
            success: ->(resource){ resource },
            failure: ->(resource){ status 400; resource.errors },
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
