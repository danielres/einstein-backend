require "test_helper"

class APITest::GroupsTest < ActiveSupport::TestCase

    def app
      V1::Groups
    end

    describe "POST /api/v1/groups" do
      describe "when required params are present" do
        it "returns an HTTP status 201 with the representation of the resource created" do
          post '/api/v1/groups', { group: { name: 'My group', description: 'My description'} }
          last_response.status.must_equal 201
          JSON.parse(last_response.body)['id'].must_be :present?
          JSON.parse(last_response.body)['name'].must_equal 'My group'
          JSON.parse(last_response.body)['created_at'].must_be :present?
          JSON.parse(last_response.body)['updated_at'].must_be :present?
        end
      end

      %w(name description).each do |param|
        describe "when param '#{param}' is missing" do
          it "returns an HTTP status 400 with a list of errors" do
            post '/api/v1/groups'
            last_response.status.must_equal 400
            JSON.parse(last_response.body)[param].must_be :present?
            last_response.body.must_include "can't be blank"
            last_response.body.must_include "is too short"
          end
        end
      end

    end


    describe "GET /api/v1/groups" do
      describe "when groups have been created" do
        before do
          post '/api/v1/groups', { group: { name: 'My group 1', description: 'My description 1'} }
          post '/api/v1/groups', { group: { name: 'My group 2', description: 'My description 2'} }
        end
        it "returns an HTTP status 201 with the representation of the resources created" do
          get '/api/v1/groups'
          last_response.status.must_equal 200
          JSON.parse(last_response.body).size.must_equal 2
          JSON.parse(last_response.body)[0]['id'].must_be :present?
          JSON.parse(last_response.body)[0]['name'].must_equal 'My group 1'
          JSON.parse(last_response.body)[0]['description'].must_equal 'My description 1'
          JSON.parse(last_response.body)[1]['id'].must_be :present?
          JSON.parse(last_response.body)[1]['name'].must_equal 'My group 2'
          JSON.parse(last_response.body)[1]['description'].must_equal 'My description 2'
        end
      end
    end


  end
