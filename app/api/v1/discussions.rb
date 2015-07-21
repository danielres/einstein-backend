module V1
  class Discussions < Grape::API

    resource :discussions do

      desc 'Creates a new discussion.'
      post do
        AddingADiscussion
          .new(current_user)
          .call(
            params,
            success: ->(resource){ resource },
            failure: ->(resource){ status 400; resource.errors },
          )
      end

    end

  end
end
