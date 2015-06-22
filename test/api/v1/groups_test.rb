require "test_helper"

class APITest::GroupsTest < ActiveSupport::TestCase

    def app
      V1::Groups
    end

    describe "POST /api/v1/groups" do
      it "creates a group" do
        post '/api/v1/groups', { name: 'My group' }, 'Content-Type' => 'application/json'
        last_response.status.must_equal 201
        expected = {'name' => 'My group' }.to_json
        last_response.body.must_equal expected
      end
    end

  end
