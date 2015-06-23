module V1
  class Groups < Grape::API

    resource :groups do


      desc 'Creates a new group.'
      post do
        AddingAGroup
          .new(User.new)
          .call(name: params[:name])
      end


      desc 'Returns a list of groups.'
      get do
        [
          {
            "id" => 0,
            "name" => "Political Science Q/A",
            "description" => "User-centric disintermediate matrix",
            "members" => [
              {
                "id" => 0,
                "name" => "Colton Satterfield",
                "avatar" => "https://s3.amazonaws.com/uifaces/faces/twitter/nitinhayaran/128.jpg"
              },
              {
                "id" => 1,
                "name" => "Roxane Metz IV",
                "avatar" => "https://s3.amazonaws.com/uifaces/faces/twitter/marshallchen_/128.jpg"
              },
              {
                "id" => 2,
                "name" => "Jacinthe Fahey",
                "avatar" => "https://s3.amazonaws.com/uifaces/faces/twitter/collegeman/128.jpg"
              },
              {
                "id" => 3,
                "name" => "Douglas Predovic",
                "avatar" => "https://s3.amazonaws.com/uifaces/faces/twitter/panghal0/128.jpg"
              }
            ]
          }
        ]
      end


    end

  end
end
