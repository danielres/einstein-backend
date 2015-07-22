module V1
  class Discussions < Grape::API

    resource :discussions do

      desc 'Creates a new discussion.'
      post do
        AddingADiscussion
          .new(current_user)
          .call(
            params,
            success: ->(resource){ DiscussionSerializer.new(resource, root: false) },
            failure: ->(resource){ status 400; resource.errors },
          )
      end


      desc 'Returns a discussion by id.'
      get '/:id' do
        ViewingADiscussion
          .new(current_user)
          .call(
            params[:id],
            success: ->(resource){ DiscussionSerializer.new(resource, root: false) },
            failure: ->(resource){ status 404 },
          )
      end

    end

  end
end
