require "test_helper"

class APITest::GroupsTest < ActiveSupport::TestCase

    def app
      V1::Groups
    end

    describe "POST /api/v1/groups" do
      it "creates a group" do
        post '/api/v1/groups', { group: { name: 'My group'} }, 'Content-Type' => 'application/json'
        last_response.status.must_equal 201
        JSON.parse(last_response.body)['id'].must_equal 1
        JSON.parse(last_response.body)['name'].must_equal 'My group'
        JSON.parse(last_response.body)['created_at'].must_be :present?
        JSON.parse(last_response.body)['updated_at'].must_be :present?
      end
    end

  end
