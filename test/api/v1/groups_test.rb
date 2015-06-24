require "test_helper"

class APITest::GroupsTest < ActiveSupport::TestCase

    def app
      V1::Groups
    end

    describe "POST /api/v1/groups" do
      it "creates a group" do
        post '/api/v1/groups', { group: { name: 'My group'} }
        last_response.status.must_equal 201
        JSON.parse(last_response.body)['id'].must_be :present?
        JSON.parse(last_response.body)['name'].must_equal 'My group'
        JSON.parse(last_response.body)['created_at'].must_be :present?
        JSON.parse(last_response.body)['updated_at'].must_be :present?
      end
    end

  end
