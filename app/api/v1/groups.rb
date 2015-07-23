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

      route_param :discutable_id do
        desc 'Returns all discussions from a group'
        get 'discussions' do
          Group.find(params[:discutable_id]).discussions
        end

        desc 'Returns a discussion by id from a group'
        get 'discussions/:discussion_id' do
          ViewingADiscussion
            .new(current_user)
            .call(
              params[:discussion_id],
              success: ->(resource){ DiscussionSerializer.new(resource, root: false) },
              failure: ->(resource){ status 404 },
            )
        end

        desc 'Creates a new discussion in a group'
        post 'discussions' do
          group = Group.find(params.delete(:discutable_id))
          AddingADiscussion
            .new(current_user, discutable: group)
            .call(
              params,
              success: ->(resource){ resource },
              failure: ->(resource){ status 400; resource.errors },
            )
        end
      end


    end

  end
end
